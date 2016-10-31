#include "gomob.h"
#include "core/globals.h"
#include "core/variant.h"
#include "core/message_queue.h"

#import <GoogleMobileAds/DFPBannerView.h>
#import <GoogleMobileAds/GADRequest.h>
#import <UIKit/UIKit.h>

#import "app_delegate.h"

Gomob* instance = NULL;

Gomob::Gomob() {
    ERR_FAIL_COND(instance != NULL);
    instance = this;
    initialized = false;
    test = true;
    bottom = true;
    //Kamil
    //ors
}

Gomob::~Gomob() {
    instance = NULL;
}

void Gomob::init(const String &adsId) {
  this->adsId = adsId;
}

void Gomob::set_test(bool val) {
  this->test = val;
}

void Gomob::set_top(bool val) {
  this->bottom = !val;
  this->abc = true;
}

void Gomob::set_bottom(bool val) {
  this->bottom = val;
}

void Gomob::show() {
  if(!initialized) {
    DFPBannerView *bannerView_ = [[DFPBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];

    if(test) {
      bannerView_.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    }
    else {
      bannerView_.adUnitID = [NSString stringWithCString:adsId.utf8().get_data() encoding:NSUTF8StringEncoding];
    }

    NSLog(@"adUnitID: %@", bannerView_.adUnitID);

    ViewController * root_controller = (ViewController *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).window.rootViewController;


    bannerView_.rootViewController = root_controller;


    GADRequest *request = [GADRequest request];

    request.testDevices = @[ @"2077ef9a63d2b398840261c8221a0c9a"];
    [bannerView_ loadRequest:request];

    if(bottom) {
      float height = root_controller.view.frame.size.height;
      float width = root_controller.view.frame.size.width;
      NSLog(@"height: %f, width: %f", height, width);
      [bannerView_ setFrame:CGRectMake(0, height-bannerView_.bounds.size.height, bannerView_.bounds.size.width, bannerView_.bounds.size.height)];
    }

    [root_controller.view addSubview:bannerView_];
    initialized = true;
  }
}

void Gomob::_bind_methods() {
    ObjectTypeDB::bind_method("init",&Gomob::init);
    ObjectTypeDB::bind_method("set_test",&Gomob::set_test);
    ObjectTypeDB::bind_method("set_top",&Gomob::set_top);
    ObjectTypeDB::bind_method("set_bottom",&Gomob::set_bottom);
    ObjectTypeDB::bind_method("show",&Gomob::show);
}
