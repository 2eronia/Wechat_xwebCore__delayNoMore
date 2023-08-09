## Flush_wechat_xwebCore

It's so annoying that Wechat doesn't utilize its own modified webview but not system's.
Simply deleting the xweb directory under /data/data/com.tencent.mm or /data/user/999/com.tencent.mm is a way to make Wechat rendering with system webview but may cause some unexpected issues.

Then I intend to just flush the libxwebcore.so to let Wechat utilize system webview.
And I also try to prevent Wechat from rewriting this file via chattr.
But what is redicular is that this file could be located in /app_xwalk_xxxx or /app_xweb_data/xweb_xxxx.

So I took some effort to write this script.

# ps. It is said Mr.Zhang is an orphan.
