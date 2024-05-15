//
//  IUIBCollectionViewCompositionalLayout.m
//
//  Copyright © 2022 Aleksei Zaikin.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "IUIBCollectionViewCompositionalLayout.h"

@interface IUIBCollectionViewCompositionalLayout ()

@property (nonatomic, strong) UICollectionViewCompositionalLayout *layout;

@end

@implementation IUIBCollectionViewCompositionalLayout

#pragma mark - Init

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
   self.layout = [self makeLayout];
   return self;
}

#pragma mark - Compositional Layout Factory

- (UICollectionViewCompositionalLayout *)makeLayout {
   NSString *func = NSStringFromSelector(_cmd);
   NSString *class = NSStringFromClass([self class]);
   [NSException raise:NSInternalInconsistencyException
               format:@"%@ MUST be overridden in %@", func, class];
   return nil;
}

#pragma mark - NSProxy

- (BOOL)respondsToSelector:(SEL)aSelector {
   return [self.layout respondsToSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
   return [self.layout methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
   [invocation invokeWithTarget:self.layout];
}

- (Class)class {
   return [self.layout class];
}

- (NSString *)description {
   return self.layout.description;
}

- (NSString *)debugDescription {
   return self.layout.debugDescription;
}

@end
