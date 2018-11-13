# SlidingViewController1


Simple Example
--------------

// UISwipeGesture
upSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeMenuUp)];
upSwipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
[uivTopMenu addGestureRecognizer:upSwipeGesture];

// TopMenu(Hamburger)
uivTopMenu.frame = CGRectMake(0.0f, -(uivTopMenu.frame.size.height), uivTopMenu.frame.size.width, uivTopMenu.frame.size.height);

[self.view addSubview:uivTopMenu];

[uivTopMenu setHidden:YES];
    
// uibServiceInfo
[uibServiceInfo setAlpha:0.0f];

    

License
-------

Copyright 2012-2014 Jeremy Feinstein

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
