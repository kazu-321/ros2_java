FROM ros:humble-ros-base

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
    default-jdk \
    gradle \
    curl \
    git \
    python3-colcon-common-extensions \
    python3-pip \
    python3-vcstool && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install -U git+https://github.com/colcon/colcon-gradle \
    && python3 -m pip install --no-deps -U git+https://github.com/colcon/colcon-ros-gradle \
    && rm -rf /root/.cache/pip

WORKDIR /ws/ros2_java_ws

RUN apt-get update \
    && rosdep update \
    && mkdir -p src \
    && curl -sSL https://raw.githubusercontent.com/kazu-321/ros2_java/main/ros2_java_desktop.repos | vcs import src \
    && rosdep install --from-paths src -y -i --skip-keys "ament_tools" \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /root/.ros/sources.cache

ENV ROS2JAVA_INSTALL_PATH=/ws/ros2_java_ws/install

RUN source /opt/ros/humble/setup.bash  && \
    colcon build &&\
    rm -rf build log

CMD ["bash"]
