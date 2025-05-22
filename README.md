# ROS 2 Java client library
[![build docker image](https://github.com/kazu-321/ros2_java/actions/workflows/docker_build.yaml/badge.svg)](https://github.com/kazu-321/ros2_java/actions/workflows/docker_build.yaml)

## Introduction

This is a set of projects (bindings, code generator, examples and more) that enables developers to write ROS 2
applications for the JVM and Android.

Besides this repository itself, there's also:
- https://github.com/ros2-java/ament_java, which adds support for Gradle to Ament
- https://github.com/ros2-java/ament_gradle_plugin, a Gradle plugin that makes it easier to use ROS 2 in Java and Android project. The Gradle plugin can be installed from Gradle Central https://plugins.gradle.org/plugin/org.ros2.tools.gradle
- https://github.com/ros2-java/ros2_java_examples, examples for the Java Runtime Environment
- https://github.com/ros2-java/ros2_android_examples, examples for Android

### Is this Java only?

No, any language that targets the JVM can be used to write ROS 2 applications.

### Including Android?

Yep! Make sure to use Fast-RTPS as your DDS vendor and at least [this revision](https://github.com/eProsima/Fast-RTPS/commit/5301ef203d45528a083821c3ba582164d782360b).

### Features

The current set of features include:
- Generation of all builtin and complex ROS types, including arrays, strings, nested types, constants, etc.
- Support for publishers and subscriptions
- Tunable Quality of Service (e.g. lossy networks, reliable delivery, etc.)
- Clients and services
- Timers
- Composition (i.e. more than one node per process)
- Time handling (system and steady, ROS time not yet supported https://github.com/ros2-java/ros2_java/issues/122)
- Support for Android
- Parameters services and clients (both asynchronous and synchronous)

## Sounds great, how can I try this out?

### Install dependencies

> Note: While the following instructions use a Linux shell the same can be done on other platforms like Windows with slightly adjusted commands.

1. [Install ROS 2](https://index.ros.org/doc/ros2/Installation).

1. Install Java and a JDK.

    On Ubuntu, you can install OpenJDK with:

        sudo apt install default-jdk

1. Install Gradle.
Make sure you have Gradle 3.2 (or later) installed.

    *Ubuntu Bionic or later*

        sudo apt install gradle


1. Install build tools:

        sudo apt install curl python3-colcon-common-extensions python3-pip python3-vcstool

1. Install Gradle extensions for colcon:

        python3 -m pip install -U git+https://github.com/colcon/colcon-gradle
        python3 -m pip install --no-deps -U git+https://github.com/colcon/colcon-ros-gradle

### Download and Build ROS 2 Java for Desktop

1. Source your ROS 2 installation, for example:

        source /opt/ros/humble/setup.bash

1. Download the ROS 2 Java repositories into a workspace:

        mkdir -p ros2_java_ws/src
        cd ros2_java_ws
        curl -skL https://raw.githubusercontent.com/kazu-321/ros2_java/main/ros2_java_desktop.repos | vcs import src

1. **Linux only** Install ROS dependencies:

        rosdep install --from-paths src -y -i --skip-keys "ament_tools"

1. Build desktop packages:

        colcon build
   *Note, Do not use symlink-install*

## Contributing

Contributions are more than welcome!
If you'd like to contribute to the project, please read [CONTRIBUTING](CONTRIBUTING.md) for contributing guidelines.
