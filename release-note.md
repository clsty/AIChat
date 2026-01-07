<!--
此文件的全部内容（除注释外）将作为 Release 说明，
每发一版都请手动清空下面的内容。
开头这几行注释不会被写入到 Release 说明，
请始终保留，不要删除。

发布 Release 的方法：
- 确保本地**最新**的提交信息为 [Release]版本号，例如 [Release]1.0.0，
- 推送到 main 分支即可。

注意：
- tag 会自动创建，不需要在本地打 git tag。
- 若有相同 tag 的 Release，原 Release 将被删除。
-->
插件更新：
- 在线构建时，自动将版本号写入插件（by @clsty ）
- 在插件 UI 开头显示版本号（by @clsty ）

基础设施更新：
- 更新构建流程，统一使用 dotnet（by @GarfieldGod @clsty ）
- 更新 UnityEngine、BepInEx 相关文件下载流程，统一使用 python 脚本（by @GarfieldGod @clsty ）
- 添加 Windows 下的构建流程说明（by @GarfieldGod ）
- 预览版 tag 自动重置，实现置顶效果（by @clsty ）
- 添加稳定版 Release 的 workflow（by @clsty ）
