/* +----------------------------------+
   |    ULTIMATE CONFIGURABLE DICE    |
   +----------------------------------+
   | First release: 01 DEC 2016       |
   | Author: Henrik Sozzi             |
   | Country: Italy                   |
   | E-Mail: henrik_sozzi@hotmail.com |
   +----------------------------------+-----------------------+
   | Twitter: https://twitter.com/henriksozzi                 |
   | Thingiverse: http://www.thingiverse.com/energywave/about |
   | 3DHUB: https://www.3dhubs.com/milan/hubs/3d-lab          |
   | Shapeways: http://3dlabshop.com                          |
   +----------------------------------------------------------+
   | LICENSE: Creative Commons - Attribution - Non-Commercial |
   | All uses not included in the license like, but not       |
   | limited to, commercial use should be authorized by the   |
   | author in a written form. If not authorized all other    |
   | uses are forbidden and persecuted by law.                |
   +----------------------------------------------------------+
*/


// Dice size in (mm)
DiceSide = 20; // [5:1:50]
// How much to "spherize" the dice. 0=cube, 10=normal, 20=max roundness
Roundness = 10; // [0:1:20]

EngravingDepth = 1;
OctaSide = DiceSide / 2;

module chamf_octa() {
  // octahedron based on code by Willliam A Adams
  octapoints = [
	[+1, 0, 0],  // + x axis
	[-1, 0, 0],	// - x axis
	[0, +1, 0],	// + y axis
	[0, -1, 0],	// - y axis
	[0, 0, +1],	// + z axis
	[0, 0, -1] 	// - z axis
  ];
  octafaces = [
	[4,2,0],
    [4,0,3],
    [4,3,1],
    [4,1,2],
    [5,0,2],
    [5,3,0],
    [5,1,3],
	[5,2,1]	
  ];
  intersection() {
    rotate([0,0,45])
    scale(v=[OctaSide*1.31,OctaSide*1.31,OctaSide*0.955]) {
      polyhedron(points=octapoints,faces=octafaces);
    };
    scale(v=OctaSide) {    
      polyhedron(points=octapoints,faces=octafaces); 
    };
    sphere(SphereRadius*0.6, $fn=150);
  }
}
difference(){
  chamf_octa();

rotate([0,54.75,45])
translate([DiceSide/-4,DiceSide/-4,DiceSide/-4-0.78])
scale([DiceSide/100,DiceSide/100,EngravingDepth/100])
scale([0.5,0.5,1])
surface(file = "nr1.png", center = false, invert = false);

mirror([1,0,0])
rotate([0,54.75,45])
translate([DiceSide/-4,DiceSide/-4,DiceSide/-4-0.78])
scale([DiceSide/100,DiceSide/100,EngravingDepth/100])
scale([0.5,0.5,1])
surface(file = "nr2.png", center = false, invert = false);

mirror([1,1,0])
rotate([0,54.75,45])
translate([DiceSide/-4,DiceSide/-4,DiceSide/-4-0.78])
scale([DiceSide/100,DiceSide/100,EngravingDepth/100])
scale([0.5,0.5,1])
surface(file = "nr3.png", center = false, invert = false);

mirror([0,1,0])
rotate([0,54.75,45])
translate([DiceSide/-4,DiceSide/-4,DiceSide/-4-0.78])
scale([DiceSide/100,DiceSide/100,EngravingDepth/100])
scale([0.5,0.5,1])
surface(file = "nr4.png", center = false, invert = false);

mirror([0,0,1])
rotate([0,54.75,45])
translate([DiceSide/-4,DiceSide/-4,DiceSide/-4-0.78])
scale([DiceSide/100,DiceSide/100,EngravingDepth/100])
scale([0.5,0.5,1])
surface(file = "nr2.png", center = false, invert = false);

mirror([1,0,1])
rotate([0,54.75,45])
translate([DiceSide/-4,DiceSide/-4,DiceSide/-4-0.78])
scale([DiceSide/100,DiceSide/100,EngravingDepth/100])
scale([0.5,0.5,1])
surface(file = "nr1.png", center = false, invert = false);

mirror([1,1,1])
rotate([0,54.75,45])
translate([DiceSide/-4,DiceSide/-4,DiceSide/-4-0.78])
scale([DiceSide/100,DiceSide/100,EngravingDepth/100])
scale([0.5,0.5,1])
surface(file = "nr4.png", center = false, invert = false);

mirror([0,1,1])
rotate([0,54.75,45])
translate([DiceSide/-4,DiceSide/-4,DiceSide/-4-0.78])
scale([DiceSide/100,DiceSide/100,EngravingDepth/100])
scale([0.5,0.5,1])
surface(file = "nr3.png", center = false, invert = false);

}

// */