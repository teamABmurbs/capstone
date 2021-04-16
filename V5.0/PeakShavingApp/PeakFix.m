
% create the simulation input
                simInp = Simulink.SimulationInput('MassSpringDamperModel');
                % set the parameters for this run
                simInp = simInp.setVariable('k',app.StiffnessSpinner.Value);
                simInp = simInp.setVariable('m',app.MassSpinner.Value);
                simInp = simInp.setVariable('b',app.DampingSpinner.Value);
                simInp = simInp.setVariable('x0',app.InitialPositionEditField.Value);

% set the model parameters for this run
                stopTimeStr = num2str(app.StopTimeSpinner.Value);
                simInp = simInp.setModelParameter('StopTime', stopTimeStr);
                % set the external input for this run
                simInp.ExternalInput = app.externalInput();
                % configure simInp for deployment
                simInp = simulink.compiler.configureForDeployment(simInp);
                % DEBUG TIP: Comment out the line above forsim
                Out = sim(simInp);