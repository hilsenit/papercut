import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import 'rxjs/add/operator/map';
import {Observable} from "rxjs";

@Component({
  selector: 'content',
  template: `
  <div class="backend-form">
      <div class="info-main-wrapper *ngFor="let work of works">
        <div class="info-column">
          <ul class="info-list">
            <li>
              Tema <br>
              {{ work.theme.title }}
            </li>
            <li>
              Dato<br>
              {{ work.created_at.strftime("%d.%m.%y") }}
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
            <li>
              <li>
          </ul><!-- .info-list -->
        </div><!-- .info-column -->
      <div class="main-column">
        <img [attr.src]="work.cover_image.thumb.url" id: "slideUpImage">
        <h2 class="text-center">{{ work.title }}</h2>
        <p class="main-text">
          {{ work.description }}
        </p>
      </div><!-- .main-column -->
      </div><!-- .info-main-wrapper -->
  </div>
  `
})
export class ContentComponent implements OnInit {
  works: {}[] = [];
  path: string;
  constructor(private http: HttpClient) {}
  
  ngOnInit(): void {
    interface WorkResponse {
      works: {}[];
    }
    var theme_id = document.querySelector('[data-theme-id]').getAttribute('theme-id');
    this.path = '/themes/' + theme_id + '/works.json';
    this.http.get<WorkResponse>(this.path)
    .subscribe(
      data => { this.works = data.works }
    )
  }
  
}
