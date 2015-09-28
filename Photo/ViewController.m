//
//  ViewController.m
//  Photo
//
//  Created by Spider on 7/28/15.
//  Copyright (c) 2015 Spider. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController () <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) NSURL *videoURL;
@property (strong, nonatomic) MPMoviePlayerController *videoController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Take:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)Pick:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    if (info[UIImagePickerControllerEditedImage]) {
        UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
        self.image.image = chosenImage;
        UIImageWriteToSavedPhotosAlbum(chosenImage, nil, nil, nil);
    } else {
        self.videoURL = info[UIImagePickerControllerMediaURL];
        self.videoController = [[MPMoviePlayerController alloc] init];
        
        [self.videoController setContentURL:self.videoURL];
        [self.videoController.view setFrame:CGRectMake (0,0,320,460)];
        [self.view addSubview:self.videoController.view];
        
        [self.videoController play];
        
        
    }

    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)takeVid:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *) kUTTypeMovie, nil];
    
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)sendMail {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        
        [mail addAttachmentData:[NSData dataWithContentsOfURL:self.videoURL] mimeType:@"video/MOV"
                       fileName:@"Video.MOV"];
        [mail setSubject:@"video"];
        [mail setMessageBody:@"body" isHTML:YES];
        [mail setToRecipients:[NSArray arrayWithObject:@"cruzbiz11@gmail.com"]];
        [self presentViewController:mail animated:YES completion:nil];
        
        }
    
         else
             
        {
            NSLog(@"Device is unable to send email.");
            
        }
       }

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
      //  NSLog(@"You sent the mail @d", result);
        break;
}
    [self dismissViewControllerAnimated:YES completion:NULL];
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



















@end
