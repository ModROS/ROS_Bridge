# ROS_Bridge
## Introduction
**ROS_Bridge** is the [Modelica](www.modelica.org) package complement of the [ROS](www.ros.org) package [***modelica_bridge***](https://github.com/ModROS/modelica_bridge.git).

The purpose of **ROS_Bridge** and **modelica_bridge** is to provide an interface between Modelica tools and ROS. This interface, or bridge, is accomplished by running tcp/ip sockets in ROS, and in an external C-function from Modelica.

## Usage Summary

The **ROS_Bridge** package consists of the external function **ROS_Socket_Call**, through which the interface to ROS is run, and the block model wrapping the function, **ROS_Sampler**.

**ROS_Sampler** is extended from the `DiscreteMIMO` block interface, and uses a sampler call to run the function call every sample period. It has the four parameters of the `DiscreteMIMO` interface - `samplePeriod`, `startTime`, `nin`, and `nout`; it has two additional parameters, `portNumber` and `hostName`. `portNumber` is the port on which the server socket is listening (where the ROS node is listening). `hostName` is the name of the machine ROS is running on (i.e. 192.168.0.1, etc.)
- Note that the `portNumber` parameter must match the `port_num_` parameter in **modelica_bridge**. 
- Regardless of the number of control values coming from ROS, **ROS_Socket_Call** only reads `nout` many, so overflow will not happen. 
  - It does not provide zero-padding for insufficient control inputs; instead, it leaves the associated control value unaltered. If control values were never provided for that input, it will be assumed zero.

The package can take up to 256 inputs from the ROS controllers, and can send a maximum of 1024 characters over a character buffer to Modelica. It has two parameters: *port_num* and *update_rate*. Ensure that the *port_num* matches the value of the Modelica model's port number parameter.

## Tutorials
For tutorials, see the [modelica_bridge tutorials](https://wiki.ros.org/modelica_bridge/Tutorials).
