import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import 'rxjs/add/operator/map';
import {Observable} from "rxjs";

@Component({
  selector: 'content',
  template: `
  <div class="info-main-wrapper">
    <div class="info-column">
      <ul class="info-list">
        <li data-theme-title="true">
          Tema <br>
          {{ theme.title }}
        </li>
        <li>
          Dato<br>
          {{ current_work.created_at | date: 'dd.mm.yy'}}
        </li>
        <li *ngIf="current_work.type_of_content">
          Type<br>
          {{ current_work.type_of_content }}
        </li>
        <li *ngIf="current_work.created_by">
          Tekst af<br>
          {{ current_work.created_by }}
        </li>
        <li *ngIf="current_work.photo_by">
          Foto af<br>
          {{ current_work.photo_by }}
        </li>
        <li>
          Tags<br>
          Kommer snart
        </li>
        <li>Del:
          <a href="#" class="share-buttons">FB</a>
          <a href="#" class="share-buttons">IG</a>
        </li>
      </ul><!-- .info-list -->
    </div><!-- .info-column -->
    <div class="main-column">
      <img *ngIf="current_work.cover_image.url" [src]="current_work.cover_image.thumb.url" id="slideUpImage">
      <h2 class="text-center">{{ current_work.title }}</h2>
      <p class="main-text" [innerHTML]="current_work.description"></p>
    </div><!-- .main-column -->
  </div>
  `
})
export class ContentComponent implements OnInit {
  works: {}[] = [];
  current_work: {};
  theme: {};
  path: string;
  constructor(private http: HttpClient) {}
  
  ngOnInit(): void {
    interface WorkResponse {
      works: {}[];
      theme: {};
    }
    var theme_id = document.querySelector('[data-theme-id]').getAttribute('theme-id');
    this.path = '/themes/' + theme_id + '/works.json';
    this.http.get<WorkResponse>(this.path)
    .subscribe(
      data => { 
        this.works = data.works,
        this.current_work = data.works[0],
        this.theme = data.theme
      }
    )
  }
  
}
