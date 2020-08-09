#include <stdio.h>
#include <tchar.h>
#include <locale.h>
#include <iostream>
#include <windows.h>
#include <wingdi.h>
#include <d2d1.h>
#include <dwrite.h>
 
 
// define
#ifndef D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT
#define D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT  ( 0x00000004 )
#endif
 
 
// lib
#pragma comment( lib, "user32.lib" )
#pragma comment( lib, "d2d1.lib" )
#pragma comment( lib, "dwrite.lib" )
 
 
 
/*
    メインウインドウイベント処理
*/
LRESULT CALLBACK eMainWindowProc(
      HWND   hwnd   // handle to window
    , UINT   uMsg   // message identifier
    , WPARAM wParam // first message parameter
    , LPARAM lParam // second message parameter
);
 
 
 
/*
    UTF32をUTF16に変換する
*/
std::wstring UTF32toUTF16
(
    ULONG qUnicode
)
{
    WCHAR waBuf[ 4 ] = { 0 };
 
    if ( 0x10000 > qUnicode ) {
 
        // 0x10000未満
        waBuf[ 0 ] = (WCHAR)qUnicode;
    }
    else {
 
        // 0x10000以上(サロゲートペアにする)
        waBuf[ 0 ] = (WCHAR)( ( qUnicode - 0x10000 ) / 0x400 + 0xd800 );
        waBuf[ 1 ] = (WCHAR)( ( qUnicode - 0x10000 ) % 0x400 + 0xdc00 );
    }
 
    // 処理結果を返す
    return( waBuf );
}
 
 
 
// グローバル変数
ID2D1Factory* pD2d1Factory = NULL;
IDWriteFactory* pDWFactory = NULL;
ID2D1DCRenderTarget* pRenderTarget = NULL;
 
// 絵文字文字列
std::wstring strEmoji;
 
 
 
/*
    Direct2Dでカラー絵文字を描画
*/
int _tmain
(
      int argc
    , _TCHAR* argv[]
)
{
    // 標準出力にユニコードを表示できるようにする
    setlocale( LC_ALL, "Japanese" );
 
    WNDCLASSEX tWndClass;
    HINSTANCE  hInstance;
    TCHAR*     cpClassName;
    TCHAR*     cpWindowName;
    TCHAR*     cpMenu;
    HWND       hWnd;
    MSG        tMsg;
 
 
    // アプリケーションインスタンス
    hInstance    = ::GetModuleHandle( NULL );
 
    // クラス名称
    cpClassName  = _T("MainWindowClass");
 
    // メニュー
    cpMenu       = MAKEINTRESOURCE( NULL );
 
    // ウインドウ名称
    cpWindowName = _T("Direct2Dでカラー絵文字を描画");
 
    // ウインドウクラスパラメータセット
    tWndClass.cbSize        = sizeof( WNDCLASSEX );
    tWndClass.style         = CS_HREDRAW | CS_VREDRAW;
    tWndClass.lpfnWndProc   = eMainWindowProc;
    tWndClass.cbClsExtra    = 0;    // ::GetClassLong で取得可能なメモリ
    tWndClass.cbWndExtra    = 0;    // ::GetWindowLong で取得可能なメモリ
    tWndClass.hInstance     = hInstance; 
    tWndClass.hIcon         = ::LoadIcon( NULL, IDI_APPLICATION );
    tWndClass.hCursor       = ::LoadCursor( NULL, IDC_ARROW );
    tWndClass.hbrBackground = (HBRUSH)( COLOR_WINDOW + 1 );
    tWndClass.lpszMenuName  = cpMenu;
    tWndClass.lpszClassName = cpClassName;
    tWndClass.hIconSm       = NULL;
 
    // ウインドウクラス生成
    if ( 0 == ::RegisterClassEx( &tWndClass ) ) {
 
        /* 失敗 */
        return( -1 );
    }
 
    // ウインドウを生成する
    hWnd = ::CreateWindowEx (
          0                       // extended window style
        , tWndClass.lpszClassName // pointer to registered class name
        , cpWindowName            // pointer to window name
        , WS_OVERLAPPEDWINDOW     // window style
        , CW_USEDEFAULT           // horizontal position of window
        , CW_USEDEFAULT           // vertical position of window
        , 640                     // window width
        , 480                     // window height
        , NULL                    // handle to parent or owner window
        , NULL                    // handle to menu, or child-window identifier
        , hInstance               // handle to application instance
        , (VOID*)0x12345678       // pointer to window-creation data
    );
 
 
    /*
        メッセージループ
    */
    while( 0 != ::GetMessage( &tMsg, NULL, 0, 0 ) ) {
        ::TranslateMessage ( &tMsg );
        ::DispatchMessage ( &tMsg );
    }
 
    // WM_QUITの終了コードを返却する
    return( tMsg.wParam );
}
 
 
 
/*
    メインウインドウイベント処理
*/
LRESULT CALLBACK eMainWindowProc
(
      HWND   hWnd   // handle to window
    , UINT   uMsg   // message identifier
    , WPARAM wParam // first message parameter
    , LPARAM lParam // second message parameter
)
{
    switch( uMsg ) {
    case WM_CREATE:
    //--------------------------------------------
    // WM_CREATE
    //--------------------------------------------
        {
            CREATESTRUCT* tpCreateSt = (CREATESTRUCT*)lParam;
 
            /* パラメータ表示 */
            wprintf(
                L"CREATESTRUCT¥n"
                L"¥tlpCreateParams = 0x%08x¥n"
                L"¥thInstance      = 0x%08x¥n"
                L"¥thMenu          = 0x%08x¥n"
                L"¥thwndParent     = 0x%08x¥n"
                L"¥tcy             = %d¥n"
                L"¥tcx             = %d¥n"
                L"¥ty              = %d¥n"
                L"¥tx              = %d¥n"
                L"¥tstyle          = 0x%08x¥n"
                L"¥tlpszName       = ¥"%s¥"¥n"
                L"¥tlpszClass      = ¥"%s¥"¥n"
                L"¥tdwExStyle      = 0x%08x¥n"
                , tpCreateSt->lpCreateParams
                , tpCreateSt->hInstance
                , tpCreateSt->hMenu
                , tpCreateSt->hwndParent
                , tpCreateSt->cy
                , tpCreateSt->cx
                , tpCreateSt->y
                , tpCreateSt->x
                , tpCreateSt->style
                , tpCreateSt->lpszName
                , tpCreateSt->lpszClass
                , tpCreateSt->dwExStyle
            );
 
            HRESULT hResult = S_OK;
 
            // 絵文字文字列の生成
            for ( ULONG qUnicode = 0x1f300; qUnicode <= 0x1f5ff; qUnicode++ ) {
                strEmoji += UTF32toUTF16( qUnicode );
            }
 
 
            /*
                ID2D1Factoryの生成
            */
            hResult = ::D2D1CreateFactory( D2D1_FACTORY_TYPE_MULTI_THREADED, &pD2d1Factory );
            if ( FAILED( hResult ) ) {
 
                // エラー
                std::wcout << L"D2D1CreateFactory失敗" << std::endl;
                break;
            }
 
 
            /*
                IDWriteFactoryの生成
            */
            hResult = DWriteCreateFactory( DWRITE_FACTORY_TYPE_SHARED, __uuidof(IDWriteFactory), reinterpret_cast<IUnknown**>( &pDWFactory ) );
            if ( FAILED( hResult ) ) {
 
                // エラー
                std::wcout << L"D2D1CreateFactory失敗" << std::endl;
                break;
            }
 
 
            /*
                ID2D1HwndRenderTargetの生成
            */
#if 0
            {
                D2D1_SIZE_U oPixelSize = {
                      tpCreateSt->cx
                    , tpCreateSt->cy
                };
 
                D2D1_RENDER_TARGET_PROPERTIES oRenderTargetProperties = D2D1::RenderTargetProperties();
 
                D2D1_HWND_RENDER_TARGET_PROPERTIES oHwndRenderTargetProperties = D2D1::HwndRenderTargetProperties( hWnd, oPixelSize );
 
 
                /*
                    ID2D1HwndRenderTargetの生成
                */
                hResult = pD2d1Factory->CreateHwndRenderTarget(
                          oRenderTargetProperties
                        , oHwndRenderTargetProperties
                        , &pRenderTarget
                    );
                if ( FAILED( hResult ) ) {
 
                    // エラー
                    std::wcout << L"CreateHwndRenderTarget失敗" << std::endl;
                    break;
                }
            }
#else
            {
                D2D1_RENDER_TARGET_PROPERTIES props = {
                    D2D1_RENDER_TARGET_TYPE_DEFAULT,
                    { DXGI_FORMAT_B8G8R8A8_UNORM, D2D1_ALPHA_MODE_IGNORE },
                    0, 0,
                    D2D1_RENDER_TARGET_USAGE_NONE,
                    D2D1_FEATURE_LEVEL_DEFAULT
                };
                hResult = pD2d1Factory->CreateDCRenderTarget(&props, &pRenderTarget);
                if ( FAILED( hResult ) ) {
 
                    // エラー
                    std::wcout << L"CreateDCRenderTarget失敗" << std::endl;
                    break;
                }
            }
#endif
 
            // ウインドウを表示する
            ::ShowWindow( hWnd, SW_SHOW );
        }
        break;
 
 
    case WM_DESTROY:
    //--------------------------------------------
    // WM_DESTROY
    //--------------------------------------------
        {
            // ID2D1HwndRenderTargetの破棄
            if ( NULL != pRenderTarget )  {
                pRenderTarget->Release();
            }
 
            // IDWriteFactoryの破棄
            if ( NULL != pDWFactory ) {
                pDWFactory->Release();
            }
 
            // ID2D1Factoryの破棄
            if ( NULL != pD2d1Factory )  {
                pD2d1Factory->Release();
            }
            // 終了する（ 引数はそのまま終了コードとなります ）
            ::PostQuitMessage( 0 );
        }
        break;
 
 
    case WM_SIZE:
    //--------------------------------------------
    // WM_SIZE
    //--------------------------------------------
        {
            D2D1_SIZE_U oPixelSize = { LOWORD( lParam ), HIWORD( lParam ) };
 
            // ターゲットリサイズ
            //pRenderTarget->Resize( &oPixelSize );
        }
        break;
 
 
    case WM_ERASEBKGND:
    //--------------------------------------------
    // WM_ERASEBKGND
    //--------------------------------------------
        {
            ;
        }
        return( TRUE );
 
 
    case WM_PAINT:
    //--------------------------------------------
    // WM_PAINT
    //--------------------------------------------
        {
            PAINTSTRUCT ps;
            HDC hdc = BeginPaint(hWnd, &ps);
            RECT rect;
            ::GetClientRect(hWnd, &rect);
            pRenderTarget->BindDC(hdc, &ps.rcPaint);


            // ターゲットサイズの取得
            D2D1_SIZE_F oTargetSize = pRenderTarget->GetSize();
 
            // 描画開始
            pRenderTarget->BeginDraw();
 
            // 背景のクリア
            D2D1_COLOR_F oBKColor = { 1.0f, 0.9f, 0.9f, 1.0f };
            pRenderTarget->Clear( oBKColor );
 
 
            /*
                テキストの描画
            */
            {
                /*
                    ブラシの生成
                */
                ID2D1SolidColorBrush* pBrush = NULL;
                {
                    pRenderTarget->CreateSolidColorBrush(
                              D2D1::ColorF( D2D1::ColorF::Black )
                            , &pBrush
                        );
                }
 
 
                /*
                    テキストフォーマットの生成
                */
                IDWriteTextFormat* pTextFormat = NULL;
                {
                    pDWFactory->CreateTextFormat(
                                  L"Meiryo"
                                , NULL
                                , DWRITE_FONT_WEIGHT_NORMAL
                                , DWRITE_FONT_STYLE_NORMAL
                                , DWRITE_FONT_STRETCH_NORMAL
                                , 32
                                , L""
                                ,&pTextFormat
                            );
                }
 
 
                /*
                    テキストの描画
                */
                if ( NULL != pBrush && NULL != pTextFormat ) {
 
                    // テキストの描画
                    pRenderTarget->DrawText(
                              strEmoji.c_str()  // 文字列
                            , strEmoji.size()   // 文字数
                            , pTextFormat
                            , &D2D1::RectF( 0, 0, oTargetSize.width, oTargetSize.height )
                            , pBrush
                            , (D2D1_DRAW_TEXT_OPTIONS)D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT
                        );
                }
 
                // テキストフォーマットの破棄
                pTextFormat->Release();
 
                // ブラシの破棄
                pBrush->Release();
            }
 
            // 描画終了
            pRenderTarget->EndDraw();

            ::EndPaint(hWnd, &ps);
        }
        return( FALSE );
    }
 
    // デフォルト処理呼び出し
    return ::DefWindowProc( hWnd, uMsg, wParam, lParam );
}