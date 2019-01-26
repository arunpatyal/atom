# atom

To track installed packages in Atom, run:

apm list --installed --bare > ~/.atom/package.list

To restore, use:

apm install --packages-file ~/.atom/package.list
