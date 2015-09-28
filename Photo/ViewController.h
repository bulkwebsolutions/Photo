//
//  ViewController.h
//  Photo
//
//  Created by Spider on 7/28/15.
//  Copyright (c) 2015 Spider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *image;


@end

