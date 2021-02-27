match stream.poll_next(cx) {
    Poll::Ready(Some(Ok(data))) => {
        let data: Vec<u8> = data.into();
        let message = proto::Message::decode(bytes::Bytes::from(data));
        Poll::Ready(Some(message.context("Failed to decode message")))
    }
    Poll::Ready(Some(Err(error))) => Poll::Ready(Some(Err(error.into()))),
    x => x,
}