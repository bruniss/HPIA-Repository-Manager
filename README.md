# HPIA-Repository-Manager
Creates and manages driver repositories for use by HPIA

To install download the .msi file from packages. The program will install to c:\program files (x86)\hpia driver repository management
A shortcut will be placed on your desktop

this program should be launched by a user with read/write permission to the directory you intend on installing your repository at. on first launch you will see this screen:

![image](https://github.com/johnsonsr3243/HPIA-Repository-Manager/assets/120566210/22a4c9e3-ada8-4f3e-9cad-0a8585c16460)

if you have an existing repository, navigate to the path for it, otherwise navigate to the target directory and click create. the filters currently in the repository will populate:

![image](https://github.com/johnsonsr3243/HPIA-Repository-Manager/assets/120566210/1b7b9828-2b54-4439-b985-90d3185b9866)

You can remove models by clicking the "select" checkbox and clicking "remove from repo". filters are removed by PLATFORM not model, and thus any devices sharing the platform id will also be removed.to add models click add models.

at the add models screen you can search either by platform id or by model name. when you click add the screen will add the filters, close the child form, and repopulate the datagrid on the mainform

![image](https://github.com/johnsonsr3243/HPIA-Repository-Manager/assets/120566210/e3ddb3f4-3ebd-4cc1-80d0-403179505353)

you can also add all models in an sccm namespace by clicking "import from sccm". note the giant red text.
![image](https://github.com/johnsonsr3243/HPIA-Repository-Manager/assets/120566210/f1be9d37-67d4-4faa-a815-26d7fd2424f5)



