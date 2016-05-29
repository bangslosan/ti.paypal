/**
 * ti.paypal
 *
 * Created by Hans Knoechel
 * Copyright (c) 2016 Your Company. All rights reserved.
 */

#import "TiPaypalModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiPaypalModule

#pragma mark Internal

-(id)moduleGUID
{
	return @"799af6ef-dece-432a-8ec0-723579b2c823";
}

-(NSString*)moduleId
{
	return @"ti.paypal";
}

#pragma mark Lifecycle

-(void)startup
{
	[super startup];
	NSLog(@"[INFO] %@ loaded",self);
}

#pragma - Public APIs

/**
 *  Initializes the PayPal module
 *
 *  @param args The client id keys for sandbox and production as well as the environment
 */
- (void)initialize:(id)args
{
    NSString *clientIdProduction;
    NSString *clientIdSandbox;
    NSString *environment;
    
    ENSURE_ARG_FOR_KEY(clientIdProduction, args, @"clientIdProduction", NSString);
    ENSURE_ARG_FOR_KEY(clientIdSandbox, args, @"clientIdSandbox", NSString);
    ENSURE_ARG_FOR_KEY(environment, args, @"environment", NSString);
    
    [PayPalMobile initializeWithClientIdsForEnvironments:@{
        PayPalEnvironmentProduction : clientIdProduction,
        PayPalEnvironmentSandbox : clientIdSandbox
    }];
    
    [PayPalMobile preconnectWithEnvironment:environment];
}

MAKE_SYSTEM_STR(ENVIRONMENT_PRODUCTION, PayPalEnvironmentProduction);
MAKE_SYSTEM_STR(ENVIRONMENT_SANDBOX, PayPalEnvironmentSandbox);
MAKE_SYSTEM_STR(ENVIRONMENT_NO_NETWORK, PayPalEnvironmentNoNetwork);

MAKE_SYSTEM_PROP(PAYMENT_INTENT_SALE, PayPalPaymentIntentSale);
MAKE_SYSTEM_PROP(PAYMENT_INTENT_AUTHORIZE, PayPalPaymentIntentAuthorize);
MAKE_SYSTEM_PROP(PAYMENT_INTENT_ORDER, PayPalPaymentIntentOrder);

extern NSString * _Nonnull const kPayPalOAuth2ScopeFuturePayments;
/// Share basic account information.
extern NSString * _Nonnull const kPayPalOAuth2ScopeProfile;
/// Basic Authentication.
extern NSString * _Nonnull const kPayPalOAuth2ScopeOpenId;
/// Share your personal and account information.
extern NSString * _Nonnull const kPayPalOAuth2ScopePayPalAttributes;
/// Share your email address.
extern NSString * _Nonnull const kPayPalOAuth2ScopeEmail;
/// Share your account address.
extern NSString * _Nonnull const kPayPalOAuth2ScopeAddress;
/// Share your phone number.
extern NSString * _Nonnull const kPayPalOAuth2ScopePhone;

MAKE_SYSTEM_STR(SCOPE_FUTURE_PAYMENTS, kPayPalOAuth2ScopeFuturePayments);
MAKE_SYSTEM_STR(SCOPE_PROFILE, kPayPalOAuth2ScopeProfile);
MAKE_SYSTEM_STR(SCOPE_OPEN_ID, kPayPalOAuth2ScopeOpenId);
MAKE_SYSTEM_STR(SCOPE_PAYPAL_ATTRIBUTES, kPayPalOAuth2ScopePayPalAttributes);
MAKE_SYSTEM_STR(SCOPE_EMAIL, kPayPalOAuth2ScopeEmail);
MAKE_SYSTEM_STR(SCOPE_ADDRESS, kPayPalOAuth2ScopeAddress);
MAKE_SYSTEM_STR(SCOPE_PHONE, kPayPalOAuth2ScopePhone);

@end
