# HPIA-Repository-Manager

creates and manages driver repositories for use by HPIA. using lots of functions and other snippets written by the team at hp who created cmsl, the previously listed github, and gary blok. also using some snippets and general design ideas from this similar tool:
https://github.com/ofelman/HPIA-Repository-Downloader/tree/master

info for hp cmsl is here: 
https://developers.hp.com/hp-client-management/doc/client-management-script-library

info for gary (highly recommend his blog) is here:
https://garytown.com/

**to install** download the .msi file from packages. The program will install to c:\program files (x86)\hpia driver repository management
A shortcut will be placed on your desktop. this program should be launched by a user with read/write permission to the directory you intend on installing your repository at. on first launch you will see this screen:

**to manage or create a repository**, navigate to the path for it, ensuring you are at the parent folder of the .repository folder. otherwise navigate to the target directory and click create. the filters currently in the repository will populate. you can (should) create a folder for each windows version you plan on using a repository for. You can remove models by clicking the "select" checkbox and clicking "remove from repo". filters are removed by PLATFORM not model, and thus any devices sharing the platform id will also be removed. 

**to add models** click add models. at the add models screen you can search either by platform id or by model name. when you click add the screen will add the filters, close the child form, and repopulate the datagrid on the mainform

**to add all models from sccm namespace** click "import from sccm", fill in the fields, hit load, and hit add to repo. note the big red text

**to start downloading or updating repository** once you have added whatever filters you want, click 'sync' to start a repository sync. you will see some console text in the textbox, but during this time the form will mostly be frozen and unable to be interacted with. the console will indicate when the sync has ended. logs are located in the .repository folder under 'activity'.


