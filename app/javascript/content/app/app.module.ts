import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { ContentComponent } from './content.component';

@NgModule({
  declarations: [
   ContentComponent 
  ],
  imports: [
    BrowserModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [ContentComponent]
})
export class AppModule { }
