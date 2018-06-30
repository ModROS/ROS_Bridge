within ROS_Bridge.Examples;

model TwoSpringJoystickControl "Two spring-damper system controlled by a joystick, input via ROS"
  extends Modelica.Icons.Example;
  Modelica.Mechanics.Translational.Components.SpringDamper spring1(d = 1, c = 1) "First spring damper system" annotation(Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass1(L = 0, m = 1, s.fixed = true, s.start = 1, stateSelect = StateSelect.default) "Mass of system 1" annotation(Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Fixed origin(s0 = 0) "Origin of spring damper systems" annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force force1 "Controlled external force affecting system 1" annotation(Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.PositionSensor spring1Position "Position of end of first spring" annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.SpringDamper spring2(d = 1, c = 1) "Second spring damper system" annotation(Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass2(L = 0, m = 1, s.fixed = true, s.start = 1, stateSelect = StateSelect.default) "Mass of second system" annotation(Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Force force2 "Controlled external force affecting system 2" annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.PositionSensor spring2Position "Position of second spring" annotation(Placement(visible = true, transformation(origin = {-0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ROS_Bridge.Blocks.ROS_Sampler controller(samplePeriod = 0.05, nin = 2, nout = 2) "Provides control input to achieve desired spring state (position)" annotation(Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(spring1.flange_b, mass1.flange_a) annotation(Line(visible = true, origin = {-50, 40}, points = {{-10, 0}, {10, 0}}, color = {0, 127, 0}));
  connect(origin.flange, spring1.flange_a) annotation(Line(visible = true, origin = {-93.333, 26.667}, points = {{-6.667, -26.667}, {-6.667, 13.333}, {13.333, 13.333}}, color = {0, 127, 0}));
  connect(mass1.flange_b, spring1Position.flange) annotation(Line(visible = true, origin = {-15, 40}, points = {{-5, 0}, {5, 0}}, color = {0, 127, 0}));
  connect(spring2.flange_b, mass2.flange_a) annotation(Line(visible = true, origin = {-50, -40}, points = {{-10, 0}, {10, 0}}, color = {0, 127, 0}));
  connect(mass2.flange_b, spring2Position.flange) annotation(Line(visible = true, origin = {-15, -40}, points = {{-5, 0}, {5, 0}}, color = {0, 127, 0}));
  connect(origin.flange, spring2.flange_a) annotation(Line(visible = true, origin = {-93.333, -26.667}, points = {{-6.667, 26.667}, {-6.667, -13.333}, {13.333, -13.333}}, color = {0, 127, 0}));
  connect(force1.flange, mass1.flange_b) annotation(Line(visible = true, origin = {27.075, 44.333}, points = {{42.925, -4.333}, {45.925, -4.333}, {45.925, 8.667}, {-43.85, 8.667}, {-43.85, -4.333}, {-47.075, -4.333}}, color = {0, 127, 0}));
  connect(spring1Position.s, controller.u[1]) annotation(Line(visible = true, origin = {14.75, 20}, points = {{-3.75, 20}, {0.25, 20}, {0.25, -20}, {3.25, -20}}, color = {1, 37, 163}));
  connect(spring2Position.s, controller.u[2]) annotation(Line(visible = true, origin = {14.75, -20}, points = {{-3.75, -20}, {0.25, -20}, {0.25, 20}, {3.25, 20}}, color = {1, 37, 163}));
  connect(controller.y[1], force1.f) annotation(Line(visible = true, origin = {44.75, 20}, points = {{-3.75, -20}, {0.25, -20}, {0.25, 20}, {3.25, 20}}, color = {1, 37, 163}));
  connect(controller.y[2], force2.f) annotation(Line(visible = true, origin = {44.75, -20}, points = {{-3.75, 20}, {0.25, 20}, {0.25, -20}, {3.25, -20}}, color = {1, 37, 163}));
  connect(force2.flange, mass2.flange_b) annotation(Line(visible = true, origin = {27.956, -45.004}, points = {{42.044, 5.004}, {45.044, 5.004}, {45.044, -10.008}, {-42.089, -10.008}, {-42.089, 5.004}, {-47.956, 5.004}}, color = {0, 127, 0}));
  annotation(experiment(StopTime = 100, Interval = 0.2, StartTime = 0, Tolerance = 1e-06));
end TwoSpringJoystickControl;