//
//  PDFPreViewController.m
//  HelloWorld
//
//  Created by NKO on 15/3/25.
//
//

#import "PDFPreViewController.h"

@interface PDFPreViewController ()

@end

@implementation PDFPreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

CGPDFDocumentRef GetPDFDocumentRef(NSString *filename)
{
    CFStringRef path;
    CFURLRef url;
    CGPDFDocumentRef document;
    size_t count;
    
    path = CFStringCreateWithCString (NULL, [filename UTF8String], kCFStringEncodingUTF8);
    url = CFURLCreateWithFileSystemPath (NULL, path, kCFURLPOSIXPathStyle, 0);
    
    CFRelease (path);
    document = CGPDFDocumentCreateWithURL (url);
    CFRelease(url);
    count = CGPDFDocumentGetNumberOfPages (document);
    if (count == 0) {
        printf("[%s] needs at least one page!\n", [filename UTF8String]);
        return NULL;
    } else {
        printf("[%ld] pages loaded in this PDF!\n", count);
    }
    return document;
}

void DisplayPDFPage (CGContextRef myContext, size_t pageNumber, NSString *filename)
{
    CGPDFDocumentRef document;
    CGPDFPageRef page;
    
    document = GetPDFDocumentRef (filename);
    page = CGPDFDocumentGetPage (document, pageNumber);
    CGContextDrawPDFPage (myContext, page);
    CGPDFDocumentRelease (document);
}

@end
