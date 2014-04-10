//
//  ReaderView.m
//  FlickR
//
//  Created by Antoine Galtier on 10/04/2014.
//  Copyright (c) 2014 Antoine Galtier. All rights reserved.
//

#import "ReaderView.h"


@interface ReaderView ()

@property (nonatomic, assign) int currentIndex;

@end

@implementation ReaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)displayPageAtIndex:(int)index
{
    if (index >=0 && index < [self.delegate numberOfPages])
    {
        //Récupérer la vue auprés du delegate
        UIView * view = [self.delegate pageAtIndex:index];
        
        //Supprimer les anciennes vues, ne fait rien si il n'y en a pas
        [self.subviews.lastObject removeFromSuperview];
        
        //Ajouter la vue en tant que sous-vue
        [self addSubview:view];
        self.currentIndex = index;
    }
}

-(void)layoutSubviews
{
    if (!self.gestureRecognizers.count)
    {
        UISwipeGestureRecognizer * previousPageRecognizer =
        [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(previousPage)];
        previousPageRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:previousPageRecognizer];
        
        UISwipeGestureRecognizer * nextPageRecognizer =
        [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nextPage)];
        nextPageRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:nextPageRecognizer];
        
        self.userInteractionEnabled = YES;
    }
}

- (void) previousPage
{
    [self displayPageAtIndex:self.currentIndex-1];
}

- (void) nextPage
{
    [self displayPageAtIndex:self.currentIndex+1];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
