package pixelimage.triGML.shape;
import pixelimage.Pixelimage;
import pixelimage.triGML.coreShape.FillShape;

@:structInit
class CircleShape extends FillShape {
    public var left:    Float;
    public var top:     Float;
    public var diameter:   Float;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , left = 0.
                        , top = 0.
                        , diameter = 1.
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left      = left;
        this.top       = top;
        this.diameter  = diameter;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'left':
                left     = Std.parseFloat( value );
            case 'top':
                top      = Std.parseFloat( value );
            case 'diameter':
                diameter = Std.parseFloat( value );
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ): Pixelimage {
        var temp = new Pixelimage( Math.ceil( diameter ), Math.ceil( diameter ) );
        temp.transparent = false;
        buildCircle( temp );
        pixelImage.putPixelImage( temp, Std.int( left ), Std.int( top ) );
        temp = null;
        return super.render( pixelImage );
    }

    function buildCircle( temp: Pixelimage ){
        var w = Math.round( strokeWidth/2 );
        var r = diameter/2;
        var innerR = diameter/2 - 4*w;
        var cx = diameter/2;
        var cy = diameter/2;
        var phi = 0.;
        var innerCx: Float = cx - w/4;
        var innerCy: Float = cy - w/4;
        temp.fillEllipseTri( cx, cy, r, r, strokeColor, phi );
        temp.fillEllipseTri( innerCx, innerCy, innerR, innerR, fill, phi );
    }
}
