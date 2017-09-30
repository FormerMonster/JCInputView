
#import "UIView+Extend.h"


@implementation UIView (extend)


- (void)setHJC_x:(CGFloat)HJC_x
{
    CGRect frame = self.frame;
    frame.origin.x =HJC_x;
    self.frame = frame;

}

-(CGFloat)HJC_x
{

    return self.frame.origin.x;
}

- (void)setHJC_y:(CGFloat)HJC_y
{
    CGRect frame = self.frame;
    frame.origin.y =HJC_y;
    self.frame = frame;
}

-(CGFloat)HJC_y
{
    
    return self.frame.origin.y;
}

//设置宽度
-(CGFloat)hjc_width
{
    return self.frame.size.width;
}


-(void)setHjc_width:(CGFloat)hjc_width
{
 
    CGRect frame = self.frame;
    frame.size.width = hjc_width;
    self.frame = frame;

}



-(CGFloat)hjc_height
{
    
    return self.frame.size.height;
  
}


-(void)setHjc_height:(CGFloat)hjc_height
{
    
    CGRect frame = self.frame;
    frame.size.height = hjc_height;
    self.frame = frame;
    
    
}




- (CGFloat)HJC_neibianju_x
{

    return self.frame.origin.x;
}

- (void)setHJC_neibianju_x:(CGFloat)HJC_neibianju_x
{

    CGRect frame = self.frame;
    frame.origin.x =HJC_neibianju_x;
    self.frame = frame;
    
}


- (CGFloat)HJC_neibianju_y
{

    return self.frame.origin.y;
    
}

- (void)setHJC_neibianju_y:(CGFloat)HJC_neibianju_y
{
    
    CGRect frame = self.frame;
    frame.origin.y =HJC_neibianju_y;
    self.frame = frame;
    
}

- (CGFloat)HJC_centers_x
{
    return self.center.x;
}


- (void)setHJC_centers_x:(CGFloat)HJC_centers_x
{

    CGPoint center = self.center;
    center.x = HJC_centers_x;
    self.center = center;
}

- (CGFloat)HJC_centers_y
{
    return self.center.y;
}


- (void)setHJC_centers_y:(CGFloat)HJC_centers_y
{
    
    CGPoint center = self.center;
    center.y = HJC_centers_y;
    self.center = center;
}

- (CGFloat)HJC_right
{
    return CGRectGetMidX(self.frame);
}

-(CGFloat)HJC_bottom
{
    return CGRectGetMaxY(self.frame);

}


-(void)setHJC_right:(CGFloat)HJC_right
{
    self.HJC_neibianju_x = HJC_right - self.hjc_width;
}
-(void)setHJC_bottom:(CGFloat)HJC_bottom
{
    self.HJC_neibianju_y = HJC_bottom - self.hjc_height;
}

@end
