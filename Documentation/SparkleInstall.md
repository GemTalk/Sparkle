<!-- This file was auto-generated, do not edit. Look for the source file in src-doc directory -->
<!-- Linted at https://dlaa.me/markdownlint/ -->
# Sparkle Installation

## Overview

Sparkle 1.0 Alpha is a development version of the Pharo IDE for GemStone project, which provides GemStone development tools in the Pharo client Smalltalk environment.
This initial version of Sparkle provides a limited set of debugging tools:

* The Sparkle Launcher, allowing you to create login configuration parameters and login; you may also edit, persist, and restore the login configurations.
* The Sparkle Object Explorer, allowing you to evaluate GemStone Smalltalk expressions and examine the contents of GemStone server objects.
* A Debugger, allowing you to view the debugger call stack, examine objects, and step through GemStone server code.
* A Process List, allowing you to inspect and debug any process in the gem.
Sparkle is under active development and information in this document is likely to become out of date without notice.
See the project on github: <https://github.com/GemTalk/Sparkle>

## Requirements

With Sparkle, you must use GemStone/S 64™ Bit v3.7, which has some additional features that are required for Sparkle support. v3.7 is not released as of February 15, 2022 (the date of this document), but alpha builds are available.
You should have GemStone v3.7 installed on a supported Linux server, with a Stone running and available for use.
Sparkle is supported with Pharo 9. For the Pharo client, you should have a Windows, Mac, or Linux environment in which you will install Pharo.

## GemStone Server Installation on Linux

### Install GemStone

1. Install GemStone/S 64 Bit v3.7. Note that v3.7 is under active development; versions other than the most recent may not work correctly.
2. Start a v3.7 Stone.

### Clone Sparkle from GitHub

1. Create or choose a directory for git clones; this will be referred to as _gitRepositoryDir_.
2. Clone <https://github.com/GemTalk/Sparkle.git> to _gitRepositoryDir_`/Sparkle`.
This clones the **main**  branch of the Sparkle repository.

### Install into GemStone on Linux

1. Go to a command shell that:
    * has defined $GEMSTONE to the GemStone/S 64 Bit v3.7 installation directory, and
    * has $GEMSTONE/bin on the $PATH
2. Change to the Sparkle GemStone directory:

    `cd *gitRepositoryDir*/Sparkle/src-gs`

3. Edit `loginSystemUser.topaz` to have the correct Stone name, and the password for SystemUser is set for your Stone.
4. execute the installation script:

    `./bootstrapSparkle.sh`

The result of the "errorcount" at the end of the output should be 0.
Sparkle is now installed in the GemStone server.

## Client Installation on Windows or Linux

The following instructions are for the Sparkle client, which can be run on Windows or Linux.

### Install Pharo

1. Download the launcher or launcher installer for the given platform from <https://pharo.org/download>, and install.
2. Run PharoLauncher to open the Launcher.
3. Click on ✲ **New**.
4. In the Template Category list, select **Official Distributions**.
5. Select **Pharo 9.0 - 64bit (stable)**. Be sure you select the 64-bit image.
6. Select ✲ **Create image**. This will create a new Pharo image based on the selected template.
7. Use the right-click menu item &#x2023; **Launch** to launch the image.

### Install Sparkle

There are two ways to build a Sparkle-enabled Pharo image:

* The script-based one-step install. This clones the main branches of the required git repositories into the default location, as well as performing the load.
* Manual installation by cloning the repository and loading via iceberg. This is useful if you wish to control the git repositories manually; that is, load branches other than the main branch; or perform other disk-based git operations.

#### Script-based installation

Using the script-based install, you do not need to manually clone the git repositories, nor consider the underlying git repositories; the script clones and loads for you.
The script clones Sparkle, and the other required repositories (SparkleFFI and RemoteServiceReplication) into the default location (see [Iceberg default repository location](#iceberg-default-repository-location)).

1. Launch the Pharo 9.0 image.
2. Open the Settings Browser using **Pharo > Settings** , select **Appearance** , and expand the list. Change the **User interface theme**  to "Pharo Dark." Sparkle is not yet themed and the color combinations are difficult to read in the light theme.
3. Open a Pharo Playground (workspace), and execute:

   ```smalltalk
    Metacello new
         baseline: 'Sparkle';
         repository: 'github://GemTalk/Sparkle:main';
         load
   ```

4. Save the image. You are now ready to log in; see the directions under [Login](#login).

#### Manual installation

Rather than using the above script, you may manually clone the repositories, and load these into your Pharo image. This allows you complete control over specific branches from the various git repositories.

1. On the client, create or choose a directory for git clones; this will be referred to as _gitRepositoryDir_.
2. Define the environment variable ROWAN_PROJECTS_HOME to point to _gitRepositoryDir_, prior to starting the Pharo launcher.
3. Clone the three required repositories into _gitRepositoryDir_. Provided you have set ROWAN_PROJECTS_HOME, when you load Sparkle, it will use the existing clones of these repositories, rather than cloning them:
   * [https://github.com/GemTalk/Sparkle.git](https://github.com/GemTalk/Sparkle.git)
   * [https://github.com/GemTalk/SparkleFFI.git](https://github.com/GemTalk/SparkleFFI.git)
   * [https://github.com/GemTalk/RemoteServiceReplication.git](https://github.com/GemTalk/RemoteServiceReplication.git)
4. Launch the Pharo 9.0 image.
5. Open the Settings Browser using **Pharo > Settings** , select **Appearance** , and expand the list. Change the **UserInterfaceTheme**  to "Pharo Dark." Sparkle is not yet themed and the color combinations are difficult to read in the light theme.
6. Iceberg is the tool in Pharo that provides an interface to load from and write to git repositories. Open Iceberg using **Browse > Iceberg**.
7. In the Iceberg repository list window, click + **Add**  in the upper right.
8. Select **Import from existing clone**.
9. Click the folder icon to open a file selection dialog, and navigate to _gitRepositoryDir_`\Sparkle`. Click OK to select the Sparkle directory.
10. Click on the OK button. Sparkle should appear in the Iceberg repository list.
11. Right click on Sparkle, and select **Metacello > Install Baseline of Sparkle (default)**.
12. Save the image. You are now ready to login; see [Login](#login).

##### Iceberg default repository location

The Sparkle load clones repositories into a default location, under _pharoImageDir_/`pharo-local/iceberg/GemTalk/`. This location can be configured, if you wish to keep your clones across Pharo images.
See **Settings > Tools > Software Configuration Management > Iceberg** , and check **Share repositories between images**. Once this is checked, you can enter a location for shared repositories.

## Login

There are two ways to login to the GemStone server from Sparkle.

* a Direct login creates a direct connection between a listening Gem on the server and the sparkle client. This does not require client libraries on the client.
* a GCI login performs a login using the GCI client libraries, as with logins using topaz or GBS.

### Logging in using Direct

Direct login is a two-step process; you will launch a listening Gem on the GemStone server on Linux, and connect to this Gem from the Pharo client image on Windows.

#### On the Linux server, launch a listening gem

 _Warning: This step will launch a gem that will listen for a connection on port 29299. At present, there is no security on that port._

1. Edit _gitRepositoryDir_`/Sparkle/src-gs/login.topaz` to have the correct stone name, user name, and password. You can use an unprivileged user for this, such as DataCurator. SystemUser is only required for installation.
2. Execute the listening gem launch script:

   `_gitRepositoryDir_/Sparkle/src-gs/server.sh

You should see a "Starting to listen" message.

#### On the Pharo client, connect to the listening Gem

1. Open the Sparkle Connection Launcher window using the **Library > Sparkle Connections Launcher**  menu item.
2. Select the **Direct**  tab on the right pane. Enter the following fields:
   * **Connection Name**  -- a unique identifier for this connection.
   * **Host**  -- the name or IP of the host that the Stone is on.
   * **Port**  -- the port that the listening Gem on the server is listening on. If you are using the server script described above, this will be 29299.
3. Click the + **Add**  button to add the new profile to your list of profiles.
4. Click the **Connect**  button. A Sparkle Object Explorer window will open, containing an inspector on nil.

#### Logging out of a direct connection

Click the **Disconnect**  button in the **Sparkle Connections Launcher** to terminate your connection to the GemStone server. This closes the Sparkle Object Explorer and any other open server windows.
While the client is disconnected, the listening Gem remains logged in, and will continue to listen for connections from the client. To fully logout, you must stop the listening Gem on the server (e.g., using Control-C).

### Logging in using GCI

Login using the GCI interface does not require a listening Gem on the server. However, you must have the GCI libraries available in the `clientlibs` directory.

#### Install clientlibs on the client host

In addition to the GemStone product distribution itself, GemTalk distributes clientlibs for v3.7. This directory tree packages the essential shared libraries, which are a subset of the libraries files that are included in the GemStone distribution for Linux or the GemStone Client distribution for Windows. This new packaging easily handles multiple versions of GemStone, without complicated management in the client host environment.
With Sparkle, you must use this `clientlibs` structure, rather than the libraries in a regular product or client distribution.

1. Copy the clientlibs directory tree from the distribution area, to a location on the client host file system.

#### On the Pharo client, enter connection parameters and connect

1. Open the Sparkle Connection Launcher window using the **Library > Sparkle Connections Launcher**  menu item.
2. Select the **GCI**  tab on the right pane. Enter the following fields:
   * **Connection Name**  -- a unique identifier for this connection.
   * **Host**  -- the name or IP of the host that the Stone is on, and on which the Gem will be run.
   * **Version**  -- 3.7.0 (do not omit the trailing .0).
   * **Stone**  -- the name of the running Stone.
   * **Netldi** -- the name or port number of the NetLDI on the Stone's host.
   * **User**  -- the GemStone user name, such as DataCurator.
   * **Password**  -- the password for the GemStone user.
   * **Client Libraries Path**  -- the path to `clientlibs` root directory. The connection will look within this directory structure for the correct version and the 64-bit (or 32-bit) libraries. You may type this in, or use the **Set Path**  button to navigate to the directory.
   * **Set Path**  -- a button that opens a dialog, allowing you to navigate to the `clientlibs` directory and select the value for the **Client Libraries Path**.
3. Click the + **Add**  button, to add the new profile to your list of profiles.
4. Click the **Connect**  button. A Sparkle Object Explorer window will open, containing an inspector on nil.

### Logging out of a GCI connection

To logout, click the **Disconnect**  button in the **Sparkle Connections Launcher**.
Unlike with a Direct login, this logs out the Gem, as well as disconnecting the client. The Sparkle Object Explorer and any other open server windows are closed.

## Operations in your Session

### Inspecting objects

To execute code and inspect the results, enter a GemStone Smalltalk expression in the lower Evaluator pane, and accept (Ctrl-S). The window will split, with the inspector pane appearing on the right, with a green header.
Selecting fields within this objects will add panes to the right, containing inspectors on each objects that is selected. Deselecting a field will remove the inspector pane.
You may open a new Sparkle Object Explorer using the Sparkle Connections Launcher toolbar item **Explorer**.

### Debugging

If an error occurs in the executed code, a stack pane, with a red header, will appear, instead of an inspector. Selecting frames within this stack adds panes with frame details, including method source and variables, to the right; this is similar to how object inspection is handled.

#### Inspecting stack variables

Variable values are hidden by default. To see the details of frame variables, expand the drop town immediately under the header. Selecting individual variables will add inspector panes to the right.

#### Continue, Terminate, and step

The Stack Pane has two buttons under the header; a green arrow (continue execution) and a red X (terminate execution).
Individual frame method panes include three icons on the left side: Step into, Step through blocks, and Step over. These allow control over stepping through code.
