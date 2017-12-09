import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { ContentComponent } from './content.component';

@NgModule({
  declarations: [
   ContentComponent 
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [ContentComponent]
})
export class AppModule { }
