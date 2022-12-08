package pixelimage.shapeStruct;
import pixelimage.Pixelimage;
import pixelimage.shapeStruct.FillShape;

@:structInit
class PathElementShape extends FillShape {
    public var pathData: String;
    public function new(  opacity            = 1.
                        , visibility          = true
                        , strokeColor        = 0x000000
                        , strokeWidth        = 1.
                        , strokeDashGapArray = null
                        /*strokeStart: Round*/
                        /*strokeEnd: Round*/
                        , fill = 0x000000
                        , pathData = ''
                        ){
        super( opacity, visibility, strokeColor, strokeWidth, strokeDashGapArray, fill );
        this.pathData = pathData;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'pathData':
                pathData =value;
            case _:
                super.setParameter( name, value );
        }
    }
    public override function render( pixelImage: Pixelimage ): Pixelimage {
        trace( 'Not implemented Yet');
        return super.render( pixelImage );
    }
}