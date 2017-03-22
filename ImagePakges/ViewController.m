//
//  ViewController.m
//  ImagePakges
//
//  Created by shenzhenshihua on 2017/3/21.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property(nonatomic,strong)UIImagePickerController * imagePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imagePicker = [[UIImagePickerController alloc] init];
    
    _imagePicker.delegate = self;
    _imagePicker.allowsEditing = YES;

    _imageView.layer.masksToBounds = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)action:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
        {//相册
            
            _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        }
            break;
        case 1:
        {//拍照
            
            _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;///<设置数据来源为相册
            
        }
            break;
        default:
            break;
    }
    
    [self presentViewController:_imagePicker animated:YES completion:nil];

    
}





-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
//    imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIImage *image = nil;
    //获取编辑之后的图片
    image = [info objectForKey:UIImagePickerControllerEditedImage];

         
    _imageView.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}



-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
