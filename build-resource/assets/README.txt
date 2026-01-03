详细说明见 https://github.com/qzrs777/AIChat 的 README。

===

【重要】BepInEx 安装说明：

本 Mod 需要 BepInEx 作为前置，但为避免版权问题，发布包中不再包含 BepInEx 文件。
请按以下步骤手动安装 BepInEx：

1. 从 BepInEx 官方仓库下载：
   https://github.com/BepInEx/BepInEx/releases
   
   下载 BepInEx_win_x64_5.4.23.4.zip（或更新版本）

2. 将 BepInEx 压缩包内的所有文件解压到游戏根目录
   （包括 BepInEx 文件夹、winhttp.dll、doorstop_config.ini 等）

3. 运行一次游戏，生成必要的目录结构

4. 把 AIChat.dll 放入 BepInEx/plugins，进游戏按 F9 设置 API Key 等

===

语音配置（可选）：

同时也要开启 GPT-SoVITS 的 WebAPI v2（api_v2.py）。
对于 Windows 用户，如果 GPT-SoVITS 根目录下没有 bat 脚本，
可以创建一个 txt，把以下代码粘贴进去，然后后缀改成.bat运行
@echo off
.\runtime\python.exe api_v2.py -a 127.0.0.1 -p 9880
pause

想使用语音输入功能，需要把 GPT-SoVITS 根目录中的 api_v2.py 替换成当前文件夹里的 api_v2_ex.py（记得重命名），
或者直接把 api_v2_ex.py 复制过去，然后将脚本中的 api_v2.py 改为 api_v2_ex.py，例如
@echo off
.\runtime\python.exe api_v2_ex.py -a 127.0.0.1 -p 9880
pause
