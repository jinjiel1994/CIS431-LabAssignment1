
export void twirlfilter(uniform int width, uniform int height, uniform int centreX, uniform int centreY, uniform float radius, uniform float a, uniform int px[1000][1000], uniform int py[1000][1000]){

	float angle;
	int x, y;
	foreach (c = 0 ... width, r = 0 ... height){

		x = c - centreX;
    	y = r - centreY;

       	angle = a * exp(-(x*x+y*y)/(radius*radius));

    	px[c][r] = cos(angle)*x + sin(angle)*y + centreX;
       	py[c][r] = -sin(angle)*x + cos(angle)*y + centreY;	

	}
}

