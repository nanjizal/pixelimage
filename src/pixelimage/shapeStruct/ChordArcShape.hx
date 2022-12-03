class pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;

@:structInit
class ChordArcShape extends FillShape {
    public var left:    Float;
    public var top:     Float;
    public var width:   Float;
    public var height:  Float;
    public function new(  opacity            = 1.
                        , visibility         = true;
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , left = 0.;
                        , top = 0.;
                        , width = 1.;
                        , height = 1.;
                        , startAngle = 0.
                        , sweepAngle   = ( Math.PI );
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.left   = left;
        this.top    = top;
        this.width  = width;
        this.height = height;
        this.startAngle = startAngle;
        this.sweepAngle = sweepAngle;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            cast 'left':
                left = Std.parseFloat( value );
            cast 'top':
                top = Std.parseFloat( value );
            cast 'width':
                width =  Std.parseFloat( value );
            cast 'height':
                hight = Std.parseFloat( value );
            cast 'startAngle':
                startAngle = Std.parseFloat( value );
            cast 'sweepAngle':
                sweepAngle = Std.parseFloat( value );
            cast _:
                super.setParameter( name, value );
        }
    }
    public function render( pixelImage: PixelImage ){
        trace( 'Not implemented yet' );
    }
}