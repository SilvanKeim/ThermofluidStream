within ThermofluidStream.FlowControl.Tests;
model IconTest "Test for Switches"
  extends Modelica.Icons.Example;

  replaceable package Medium = Media.myMedia.Air.SimpleAir
    constrainedby Media.myMedia.Interfaces.PartialMedium "Medium package"
    annotation (choicesAllMatching=true, Documentation(info="<html>
<p>
Medium package used in the Test.
</p>
</html>"));

  inner DropOfCommons dropOfCommons(assertionLevel = AssertionLevel.warning)
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Boundaries.Source source2(
    redeclare package Medium = Medium,
    pressureFromInput=false,
    T0_par(displayUnit="K") = 300,
    p0_par=300000)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-50,30})));
  Boundaries.Sink sink3(redeclare package Medium = Medium, p0_par=100000)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={30,30})));
  Modelica.Blocks.Sources.Ramp ramp(duration=2, startTime=0.5)
    annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
  ThermofluidStream.FlowControl.BasicControlValve basicControlValve(redeclare package Medium = Medium,
    invertInput=true,
    redeclare function valveCharacteristics =
        ThermofluidStream.FlowControl.Internal.ControlValve.linearCharacteristics,
    Kvs=1)
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  Boundaries.Source source1(
    redeclare package Medium = Medium,
    pressureFromInput=false,
    T0_par(displayUnit="K") = 300,
    p0_par=300000)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-50,-50})));
  Boundaries.Sink sink1(redeclare package Medium = Medium, p0_par=100000)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={30,-50})));
  Modelica.Blocks.Sources.Ramp ramp1(duration=2, startTime=0.5)
    annotation (Placement(transformation(extent={{-30,-30},{-10,-10}})));
  ThermofluidStream.FlowControl.BasicControlValve basicControlValve1(
    redeclare package Medium = Medium,
    invertInput=false,
    redeclare function valveCharacteristics =
        ThermofluidStream.FlowControl.Internal.ControlValve.linearCharacteristics,
    Kvs=1)
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
equation
  connect(source2.outlet, basicControlValve.inlet) annotation (Line(
      points={{-40,30},{-10,30}},
      color={28,108,200},
      thickness=0.5));
  connect(sink3.inlet, basicControlValve.outlet) annotation (Line(
      points={{20,30},{10,30}},
      color={28,108,200},
      thickness=0.5));
  connect(ramp.y, basicControlValve.u_in)
    annotation (Line(points={{-9,60},{0,60},{0,38}}, color={0,0,127}));
  connect(source1.outlet, basicControlValve1.inlet) annotation (Line(
      points={{-40,-50},{-10,-50}},
      color={28,108,200},
      thickness=0.5));
  connect(sink1.inlet, basicControlValve1.outlet) annotation (Line(
      points={{20,-50},{10,-50}},
      color={28,108,200},
      thickness=0.5));
  connect(ramp1.y, basicControlValve1.u_in)
    annotation (Line(points={{-9,-20},{0,-20},{0,-42}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-120,-100},{100,100}})),
    experiment(
      StopTime=3,
      Interval=0.01,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>Test for the switches.</p>
<p>Owner: Michael Mei&szlig;ner</p>
</html>"));
end IconTest;
