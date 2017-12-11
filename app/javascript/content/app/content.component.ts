import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import 'rxjs/add/operator/map';
import {Observable} from "rxjs";

@Component({
  selector: 'content',
  template: `
  <div class="info-main-wrapper">
    <div class="info-column">
      <ul class="info-list" *ngFor="let work of works">
        <li data-theme-title="true" *ngIf="theme.title">
          Tema <br>
          {{ theme.title }}
        </li>
        <li>
          Dato<br>
          {{ work.created_at | date: 'dd.mm.yy'}}
        </li>
        <li *ngIf="work.type_of_content">
          Type<br>
          {{ work.type_of_content }}
        </li>
        <li *ngIf="work.created_by">
          Tekst af<br>
          {{ work.created_by }}
        </li>
        <li *ngIf="work.photo_by">
          Foto af<br>
          {{ work.photo_by }}
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
  </div>
  `
})
export class ContentComponent implements OnInit {
  works: {}[] = [];
  theme: {} = null;
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
        this.theme = data.theme
      }
    )
  }
  
}
