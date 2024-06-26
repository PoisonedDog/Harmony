/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CommonConstants from '../common/constants/CommonConstants';
import mainViewModel from '../viewmodel/MainViewModel';
import ItemData from '../viewmodel/ItemData';
import router from '@ohos.router';

/**
 * Home tab content
 */
@Component
@Entry
export default struct Home {
  private swiperController: SwiperController = new SwiperController();
  scroller: Scroller = new Scroller()

  build() {
    Scroll() {
      Column({ space: CommonConstants.COMMON_SPACE }) {
        Swiper(this.swiperController) {
          ForEach(mainViewModel.getSwiperImages(), (img: Resource) => {
            Image(img).borderRadius($r('app.float.home_swiper_borderRadius'))
          }, (img: Resource) => JSON.stringify(img.id))
        }
        .autoPlay(false)

        Grid() {
          ForEach(mainViewModel.getFirstGridData(), (item: ItemData) => {
            GridItem() {
              Column() {
                Image(item.img)
                  .width($r('app.float.home_homeCell_size'))
                  .height($r('app.float.home_homeCell_size'))
                  .onClick(()=>{
                    if(item.others != null){
                      router.pushUrl({ url: item.others })
                    }
                  })
                Text(item.title)
                  .fontSize($r('app.float.little_text_size'))
                  .margin({ top: $r('app.float.home_homeCell_margin') })
              }
            }
          }, (item: ItemData) => JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .rowsGap($r('app.float.home_grid_rowGap'))
        .padding({ top: $r('app.float.home_grid_padding'), bottom: $r('app.float.home_grid_padding') })
        .height('186vp')
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.home_grid_borderRadius'))

        Row(){
          Row(){
            Image($r('app.media.hot'))
              .height('30xp')

            Text('热门活动')
              .fontSize('20vp')
              .fontWeight(FontWeight.Bolder)
              .margin({ top: $r('app.float.home_text_margin') })
          }

          Text('更多>')
            .fontSize('16vp')
            .margin({ top: $r('app.float.home_text_margin') })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')

        Swiper(this.swiperController) {
          ForEach(mainViewModel.getSwiperImagesOfPopularActivity(), (img: Resource) => {
            Image(img).borderRadius($r('app.float.home_swiper_borderRadius'))
          }, (img: Resource) => JSON.stringify(img.id))
        }
        .autoPlay(true)

        Row(){
          Image($r('app.media.travel'))
            .height('30xp')

          Text('游玩资讯')
            .fontSize('20vp')
            .fontWeight(FontWeight.Bolder)
            .width('100%')
            .margin({ top: $r('app.float.home_text_margin') })
        }
        Image($r('app.media.info'))
          .borderRadius($r('app.float.home_swiper_borderRadius'))
        Grid(this.scroller) {
          ForEach(mainViewModel.getSecondGridData(), (item: ItemData) => {
            GridItem() {
              Column() {
                Image(item.img)
                  .width('100%')
                  .height('90%')
                Text(item.title)
                  .fontSize($r('app.float.little_text_size'))
                  .margin({ top: $r('app.float.home_homeCell_margin') })
              }
            }
            .height('200vp')
          }, (item: ItemData) => JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .rowsGap('12vp')
        .height(300)
        .padding({ top: $r('app.float.home_grid_padding'), bottom: $r('app.float.home_grid_padding') })
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.home_grid_borderRadius'))
      }
    }
    // .height(CommonConstants.FULL_PARENT)
  }
}
