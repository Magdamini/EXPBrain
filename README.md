# EXPBrain
The code can be executed by running `Tumor_growth_3D.m`.   It reads MRI scan data from directory  `brain_scan`. There are 29 bitmaps of dimension 532x565 pixels.

The code runs the spatial finite difference approximation using mesh size of  dimensions `nelx = 32`, `nely = 32` and `nelz = 32`. 
  
It runs exponential time integrators for `steps = 100` time steps from time moment `t0 = 150` to `T  = 3500`. 

Those parameters and the mesh size can be changed by setting appropriate variables in the `Tumor_growth_3D.m` file.
  
It generates VTK files for ParaView with gliobastoma brain tumor evolution in `paraview_files` directory.

### Paraview visualisation
To visualize computed data, open the ParaView application . Then click “Open” from the “File” menu in the upper left corner. Choose the file `brain.vti`. It should be in the `paraview_files` directory. Once the file is selected, click on the “OK” button in the dialog box. To display the data, in the “Properties” tab, click the green “Apply” button and set the representation to “Volume”. After this step, the brain image should be visible on the screen. Then, repeat the above instructions to open files containing tumor data. While opening those files, Paraview should see them as a group of files named `tumor_..vti` and open them all at once. After setting up those files, choose the  `brain.vti` file in the “Pipeline Browser”. Then focus on the right tab, named “Color Map Editor”. Find the bar “Select a color map from default presets” or the small icon with a heart and choose one of the proposed color maps.
Use the slider to decrease the opacity. Now, both tumor and brain data should be visible on the screen. Use the mouse to rotate the image. To display (or hide) the scale, select the chosen object and click on the colorful “Toggle Color Legend Visibility” icon located in the upper left corner.
To start the animation, choose the `tumor_1.vti` file, and on the right bar, set the “Automatic Rescale Range Mode” on “Grow and update every timestep”. Then click the play button in the top part of the window. The tumor image can also be seen at a particular time. To visualize it, change the time option next to the play button and adjust the scale by clicking the “Rescale to Data Range” button.

### Mathematical details
The matematical details of the brain tumor model and numerical formulation are described in the following article [Augmenting MRI scan data with real-time predictions of glioblastoma brain tumor evolution using exponential time integrators - Magdalena Pabisz, Judit Muñoz-Matute, Maciej Paszyński ](https://arxiv.org/abs/2402.02273)
