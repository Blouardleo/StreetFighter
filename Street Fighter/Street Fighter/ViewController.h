//
//  ViewController.h
//  Street Fighter
//
//  Created by Leo Blouard on 27/02/15.
//  Copyright (c) 2015 __Blouard__. All rights reserved.
//

#import <UIKit/UIKit.h>

int temps = 99;
int difficulte = 1;
int combat = 3;
int Round = 3;
int Saut;
int sec;

@interface ViewController : UIViewController{
    NSTimer *timer;
    NSTimer *saut;
    NSTimer *seconde;
    NSTimer *TimerHadoken;
    NSTimer *TimerUppercut;
    IBOutlet UIImageView *kaio;
}

@property (weak, nonatomic) IBOutlet UIButton *moins1;
@property (weak, nonatomic) IBOutlet UIButton *plus1;
@property (weak, nonatomic) IBOutlet UILabel *difficulte;

@property (weak, nonatomic) IBOutlet UIButton *moins2;
@property (weak, nonatomic) IBOutlet UIButton *plus2;
@property (weak, nonatomic) IBOutlet UILabel *round;

@property (weak, nonatomic) IBOutlet UIButton *moins3;
@property (weak, nonatomic) IBOutlet UIButton *plus3;
@property (weak, nonatomic) IBOutlet UILabel *temps;

@property (weak, nonatomic) IBOutlet UIButton *moins4;
@property (weak, nonatomic) IBOutlet UIButton *plus4;
@property (weak, nonatomic) IBOutlet UILabel *combat;

@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *perso;

@property (weak, nonatomic) IBOutlet UIImageView *joueur;
@property (weak, nonatomic) IBOutlet UIImageView *attack;

@property (weak, nonatomic) IBOutlet UIButton *droite;
@property (weak, nonatomic) IBOutlet UIButton *gauche;
@property (weak, nonatomic) IBOutlet UIButton *haut;
@property (weak, nonatomic) IBOutlet UIButton *bas;

@property (weak, nonatomic) IBOutlet UIButton *carre;
@property (weak, nonatomic) IBOutlet UIButton *rond;
@property (weak, nonatomic) IBOutlet UIButton *triangle;
@property (weak, nonatomic) IBOutlet UIButton *croix;

@property (weak, nonatomic) IBOutlet UIImageView *ennemi;

- (void)Deplacement;
- (void)Temps;
- (void)Difficulte;
- (void)Timer;
- (void)Round;
- (void)Hadoken;
- (void)Coups;
- (void)PositionEnnemi;
- (void)Uppercut;
@end

