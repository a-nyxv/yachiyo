{ userSettings, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    ignores = [ "**/.DS_STORE" ];
    settings = {
      user = {
        name = userSettings.git.fullName;
        email = userSettings.git.email;
      };
      init = {
        defaultBranch = "main";
      };
      core.editor = userSettings.editor;
    };
  };
}
