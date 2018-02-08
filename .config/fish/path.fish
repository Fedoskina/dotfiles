set -l paths "
# yarn binary
$HOME/.yarn/bin
# yarn global modules
$HOME/.config/yarn/global/node_modules/.bin
"

for entry in (string split \n $paths)
    # resolve the {$HOME} substitutions
    set -l resolved_path (eval echo $entry)
    if test -d "$resolved_path";
        set PATH $PATH "$resolved_path"
    end
end
