within TransientVCC.Media;
package BaseClasses

  extends Modelica.Media.Interfaces.PartialTwoPhaseMedium;


  extends Modelica.Icons.BasesPackage;
  replaceable partial function vaporState_ph "Neural network model of vapor state"
    extends Modelica.Icons.Function;
    input AbsolutePressure p;
    input SpecificEnthalpy h;
    input FixedPhase phase=1;
    output ThermodynamicState state;


  end vaporState_ph;

  replaceable partial function liquidState_ph "Neural network model of vapor state"
    extends Modelica.Icons.Function;
    input AbsolutePressure p;
    input SpecificEnthalpy h;
    input FixedPhase phase=1;
    output ThermodynamicState state;

  end liquidState_ph;

  redeclare function extends density
  algorithm
    d:=state.d;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end density;

  redeclare function extends density_derh_p

  algorithm
    ddhp:=state.ddhp;
  end density_derh_p;

  redeclare function extends density_derp_h

  algorithm
    ddph:=state.ddph;
  end density_derp_h;

  redeclare replaceable function extends temperature
  algorithm
    T:=state.T;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end temperature;

  redeclare replaceable record extends ThermodynamicState

    AbsolutePressure p "Pressure";
    SpecificEnthalpy h "Specific enthalpy";
    Density d "Density";
    Temperature T "Temperature";
    DerDensityByPressure ddph "Partial derivative of density w.r.t. pressure at constant enthalpy";
    DerDensityByEnthalpy ddhp "Partial derivative of density w.r.t. enthalpy at constant pressure";
    FixedPhase phase(min=0,max=2);

  end ThermodynamicState;

  replaceable partial function twoPhaseState_ph "Neural network model of two-phase state from pressure and enthalpy"
    extends Modelica.Icons.Function;
    input AbsolutePressure p;
    input SpecificEnthalpy h;
    input FixedPhase phase=2;
    output ThermodynamicState state;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end twoPhaseState_ph;

  redeclare partial function setState_ph
    input AbsolutePressure p;
    input SpecificEnthalpy h;
    input FixedPhase phase=0;
    output ThermodynamicState state;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end setState_ph;

  redeclare function extends specificEnthalpy

  algorithm
    h:=state.h;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end specificEnthalpy;
end BaseClasses;
