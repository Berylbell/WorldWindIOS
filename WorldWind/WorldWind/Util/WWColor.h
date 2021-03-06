/*
 Copyright (C) 2013 United States Government as represented by the Administrator of the
 National Aeronautics and Space Administration. All Rights Reserved.
 
 @version $Id: WWColor.h 1318 2013-05-09 22:33:44Z dcollins $
 */

#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/gl.h>

/**
* Represents and RGBA color.
*/
@interface WWColor : NSObject

/// @name Color Attributes

/// The color's red component in the range [0,1].
@property (nonatomic) float r;

/// The color's green component in the range [0,1].
@property (nonatomic) float g;

/// The color's blue component in the range [0,1].
@property (nonatomic) float b;

/// The color's alpha component in the range [0,1].
@property (nonatomic) float a;

/// @name Initializing Colors

/**
* Initialize this color with specified red, green, blue and alpha components.
*
* @param r The color's red component in the range [0,1].
* @param g The color's green component in the range [0,1].
* @param b The color's blue component in the range [0,1].
* @param a The color's alpha component in the range [0,1].
*
* @return This color initialized to the specified values.
*/
- (WWColor*) initWithR:(float)r g:(float)g b:(float)b a:(float)a;

/**
* Initialize this color with a specified color.
*
* @param color The color identifying this colors initial values.
*
* @return This color initialized to the specified color's values.
*
* @exception NSInvalidArgumentException If the specified color is nil.
*/
- (WWColor*) initWithColor:(WWColor*)color;

/// @name Setting the Contents of Colors

/**
* Sets this color's components to the specified red, green, blue and alpha components.
*
* @param r This color's new red component in the range [0,1].
* @param g This color's new green component in the range [0,1].
* @param b This color's new blue component in the range [0,1].
* @param a This color's new alpha component in the range [0,1].
*
* @return This color set to the specified components.
*/
- (WWColor*) setToR:(float)r g:(float)g b:(float)b a:(float)a;

/**
* Sets this color to the components of the specified color.
*
* @param color The color whose components are assigned to this instance's.
*
* @return This color with its components set to those of the specified color.
*
* @exception NSInvalidArgumentException If the color is nil.
*/
- (WWColor*) setToColor:(WWColor*)color;

/// @name Operations on Colors

/**
* Multiplies this color's red, green and blue values by this color's alpha value.
*/
- (void) preMultiply;

/// @name Convenience Functions

/**
* Converts an RGBA color to a packed 32-bit integer representation.
*
* @param r The red value.
* @param g The green value.
* @param b The blue value.
* @param a The alpha value.
*
* @return A packed unsigned integer containing the r, g, b and a values, in that order.
*/
+ (unsigned int) makeColorInt:(GLubyte)r g:(GLubyte)g b:(GLubyte)b a:(GLubyte)a;

@end