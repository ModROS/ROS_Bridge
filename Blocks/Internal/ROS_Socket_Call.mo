within ROS_Bridge.Blocks.Internal;

function ROS_Socket_Call
  extends Modelica.Icons.Function;
  input Real t "time";
  input Integer port "port number";
  input String host "hostname";
  input Integer n_in "size of input signal";
  input Integer n_out "size of output signal";
  input Real query[n_in] "feedback query";
  output Real res[n_out] "returned control signal output";

  external "C" ROS_Socket_Call(t, port, host, n_in, query, n_out, res) annotation(Include = "#include \"ROS_Socket_Call.c\"", IncludeDirectory = "modelica://ROS_Bridge/Resources/");
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end ROS_Socket_Call;
