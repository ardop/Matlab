load('x');
load('y');

x = x';
t = y';

% trainFcn = 'trainlm'; 
trainFcn = 'trainbr';
% trainFcn = 'trainscg';

% Create a Fitting Network
hiddenLayerSize = 20;
net = fitnet(hiddenLayerSize,trainFcn);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 60/100;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 20/100;

% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
ynn = net(x);
ynn = ynn';

mae = find_mae(y, ynn);
disp(mae);

% performance = perform(net,t,ynn);


