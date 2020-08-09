    void
DWriteContext_DrawText(
	DWriteContext *ctx,
	HDC hdc,
	const WCHAR* text,
	int len,
	int x,
	int y,
	int w,
	int h,
	int cellWidth,
	COLORREF color)
{
    if (ctx != NULL)
    {
#if 0
	ctx->DrawText(hdc, text, len, x, y, w, h, cellWidth, color);
#else
	ctx->mRT->DrawText(text, len, ctx->mTextFormat, &D2D1::RectF(x, y, x+w, y+h), ctx->mBrush, (D2D1_DRAW_TEXT_OPTIONS)D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT);
#endif
    }
}
