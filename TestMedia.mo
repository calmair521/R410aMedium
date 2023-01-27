within DynamicVCC.Media.Test;
model TestMedia

extends Modelica.Icons.Example;

  replaceable package Medium_1=Modelica.Media.R134a.R134a_ph;
  replaceable package Medium_Media=Modelica.Media.R134a.R134a_ph;

  Medium_Media.ThermodynamicState state_media;
  Medium_1.ThermodynamicState state_1;

  Medium_Media.AbsolutePressure p;
  Medium_Media.SpecificEnthalpy h;
  Medium_Media.Density d_media=Medium_Media.density(state_media);
  Medium_1.Density d_1=Medium_1.density(state_1);
  Medium_Media.Temperature T_media=Medium_Media.temperature(state_media);
  Medium_1.Temperature T_1=Medium_1.temperature(state_1);
  Medium_Media.SpecificHeatCapacity cp_media=Medium_Media.specificHeatCapacityCp(state_media);
  Medium_1.SpecificHeatCapacity cp_1=Medium_1.specificHeatCapacityCp(state_1);
  Medium_Media.ThermalConductivity k_media=Medium_Media.thermalConductivity(state_media);
  Medium_1.ThermalConductivity k_1=Medium_1.thermalConductivity(state_1);
  Medium_Media.DynamicViscosity mu_media=Medium_Media.dynamicViscosity(state_media);
  Medium_1.DynamicViscosity mu_1=Medium_1.dynamicViscosity(state_1);

equation

  state_media=Medium_Media.setState_ph(p,h);
  state_1=Medium_1.setState_ph(p,h);

  p=(2+0.08*time)*1e5;
  h=(1.1+time*0.034)*1e5;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestMedia;
