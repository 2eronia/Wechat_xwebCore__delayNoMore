## Flush_wechat_xwebCore

It's so ~~grateful~~ annoying that Wechat utilizes its own modified webview but not system's.  
Simply deleting the xweb directory under /com.tencent.mm is a way to make Wechat rendering with system webview but may cause some unexpected issues.  

Then I intend to just flush the libxwebcore.so to make Wechat rendering with system webview.  
And I also try to prevent Wechat from rewriting this file via chattr.  

What is redicular is that this so file could be located in /app_xwalk_xxxx or /app_xweb_data/xweb_xxxx.  

So I took some effort to write this script.  
