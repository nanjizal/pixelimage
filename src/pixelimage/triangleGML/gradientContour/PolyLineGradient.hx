package pixelimage.triangleGML.gradientContour;
import pixelimage.Pixelimage;
import pixelimage.Pixelshape;
import pixelimage.triangleGML.coreShape.BasicGradient;

enum abstract ColorDirection( String ){
    var widthways = 'widthways';
    var longways = 'longways';
}

@:structInit
class PolyLineGradient extends BasicGradient {
    public var points: Null<Array<Float>>;
    public var strokeWidth: Float;
    public var colorDirection: ColorDirection;
    public function new(  opacity            = 1.
                        , visibility         = true
                        , strokeWidth        = 1.
                        , points             = null
                        , colorDirection = longways
                        , colors            = null
                        ){
        super( opacity, visibility, colors );
        this.strokeWidth = strokeWidth;
        this.colorDirection = colorDirection;
        this.points = points;
    }
    public override function setParameter( name: String, value: String ): Void {
        switch( name ){
            case 'strokeWidth':
                strokeWidth = Std.parseFloat( value );
            case 'points':
                value = value.split('[')[1].split(']')[0];
                points = [ for( n in value.split(',') ) Std.parseFloat( n )  ];
            case 'colorDirection':
                colorDirection = ( value == 'widthways' )? widthways: longways;
            case 'colors':
                value = value.split('[')[1].split(']')[0];
                cornerColors = [ for( n in value.split(',') ) Std.parseInt( n )  ];
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelShape: Pixelshape ): Pixelshape {
        {
            var l = points.length;
            if( l < 4 ) return pixelShape;
            if( l%2 != 0 ) return pixelShape;
            var i = 0;
            var x = 0.;
            var y = 0.;
            var nextX = 0.;
            var nextY = 0.;
            x = points[i] + offX;
            i++;
            y = points[i] + offY;
            i++;
            var colorCount = 0;
            var colorLen = cornerColors.length;
            var colorA = 0;
            var colorB = 0;
            var colorC = 0;
            var colorD = 0;
            while( i < l ){
                x = points[ i ] + offX;
                i++;
                y = points[ i ] + offY;
                i++;
                nextX = x;
                nextY = y;
                if( colorDirection == longways ){
                    if( colorCount >= colorLen ) colorCount = 0;
                    colorA = cornerColors[colorCount];
                    colorD = colorA;
                    colorCount++;
                    if( colorCount >= colorLen ) colorCount = 0;
                    colorB = cornerColors[colorCount];
                    colorC = colorB;
                } else {
                    if( colorCount >= colorLen ) colorCount = 0;
                    colorA = cornerColors[colorCount];
                    colorB = colorA;
                    colorCount++;
                    if( colorCount >= colorLen ) colorCount = 0;
                    colorD = cornerColors[colorCount];
                    colorC = colorD;
                    // don't want thickness to wrap round so get next
                    colorCount++;
                    if( colorCount >= colorLen ) colorCount = 0;
                }
                pixelShape.fillGradLine( x, y, nextX, nextY, strokeWidth, colorA, colorB, colorC, colorD );
            }
            
        }
        return super.render( pixelShape );
    }
}