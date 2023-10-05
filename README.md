# rosbot-xl-nav-snap

The snap provides mapping, localization and navigation capabilities
to the ROSbot-XL.

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/rosbot-xl-nav)

## Installation

Install the snap as follows,

```bash
snap install rosbot-xl-nav
```

## Setup

Upon installation, depending on your operating system,
you may have to manually connect the snap interface.
You can verify that with the following command,

```bash
$ snap connections rosbot-xl
Interface            Plug                    Slot                            Notes
content[ros-humble]  rosbot-xl:ros-humble    ros-humble-ros-base:ros-humble  manual
network              rosbot-xl:network       :network                        -
network-bind         rosbot-xl:network-bind  :network-bind                   -
```

The interface `ros-humble` must be connected.

If it isn't, you can issue the following command,

```bash
snap connect rosbot-xl-nav:ros-humble ros-humble-ros-base
```

## Use

### Slam

This application allows for mapping the environment.
It can be launch as follows,

```bash
snap start rosbot-xl-nav.slam
```

One can then drive the robot around to create a 2D representation of the environment.
Once the area is covered, stop the application with,

```bash
snap stop rosbot-xl-teleop.slam
```

Upon stopping the application automatically save the map at `${SNAP_COMMON}/maps/current_map.{png,yaml}`.

The slam configuration file can be found at `$SNAP_COMMON/config/slam_params.yaml` and can thus be edited.
Shall you want to reinitialise it,
you can simply issue the command `rosbot-xl-nav.reset-config` which will reset all configuration files.

### Localisation

The localisation allows the robot, as its name suggests,
to localise itself in the map created by the slam application.
Note that it automatically uses the last map created by the slam application.
It can be started and stopped respectively with,

```bash
snap start rosbot-xl-teleop.localisation
```

```bash
snap stop rosbot-xl-teleop.localisation
```

The slam configuration file can be found at `$SNAP_COMMON/config/localization_params.yaml` and can thus be edited.
Shall you want to reinitialise it,
you can simply issue the command `rosbot-xl-nav.reset-config` which will reset all configuration files.

### Navigation

The navigation application allows the robot to autonomously move around to a defined goal while avoiding obstacles.
Note that it automatically uses the last map created by the slam application.
It can be started and stopped respectively with,

```bash
rosbot-xl-teleop.navigation
```

The slam configuration file can be found at `$SNAP_COMMON/config/nav2_params.yaml` and can thus be edited.
Shall you want to reinitialise it,
you can simply issue the command `rosbot-xl-nav.reset-config` which will reset all configuration files.

## Notes

> **Note**
> This snap is part of an integrated snaps deployment.
> 
> Other recommended snaps to be installed are,
> 
> - [micro-xrce-dds-agent](LINK)
> - [sllidar-ros2](https://snapcraft.io/sllidar-ros2)
> - [rosbot-xl-teleop](https://snapcraft.io/rosbot-xl-teleop)
> - [rosbot-xl-nav](https://snapcraft.io/rosbot-xl-nav)
