var rectangleWidth 	= 3;
var rectangleHeight = 3;
var space 			= 1;
var numX			= 10;
var numY			= 10;
var startPower 		= 10;
var endPower 		= 100;
var startSpeed 		= 100;
var endSpeed 		= 10;

var speedStep	 	= (endSpeed-startSpeed)/(numY-1); // speed over y-axis
var powerStep 		= (endPower-startPower)/(numX-1); // power over x-axis

echo('This is a test pattern writen in Laserscript. More info:');
echo('https://github.com/t-oster/VisiCut/wiki/LaserScript. ');
echo('SETTINGS: ');
echo('numX: '+numX);
echo('numY: '+numY);
echo('startPower: '+startPower);
echo('endPower: '+endPower);
echo('startSpeed: '+startSpeed);
echo('endSpeed: '+endSpeed);
echo('RESULT: ');
for (var i = 0; i < numY; i++)
{
	var speed = (numY == 1)? startSpeed : startSpeed+i*speedStep;
	set("speed", speed);
	var echoRow = "";
	for (var j = 0; j < numX; j++)
	{
		var power = (numX == 1)? startPower : startPower+j*powerStep;
		set("power", power);
		var x = (rectangleWidth+space)*j;
		var y = (rectangleHeight+space)*i;
		rectangle(x, y, rectangleWidth, rectangleHeight);

		echoRow += '['+leadingZeros(Math.round(speed),3)+'|'+leadingZeros(Math.round(power),3)+']  ';
	}
	echo(echoRow);
}
echo('A grid will be lasercut, the grid above shows the speed and power per block. ');
echo('Syntax: [speed|power]');
echo(' ');

function rectangle(x, y, width, height) 
{
	move(x, y);
	line(x+width, y);
	line(x+width, y+height);
	line(x, y+height);
	line(x, y);
}

function leadingZeros(value, numZeros) 
{
    var s = value+"";
    while (s.length < numZeros) s = "0" + s;
    return s;
}