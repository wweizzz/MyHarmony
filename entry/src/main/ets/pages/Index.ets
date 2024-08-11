import { hilog } from '@kit.PerformanceAnalysisKit';
import { router } from '@kit.ArkUI';
import RouterPath from '../common/constant/RouterPath';
import Logger from '../utils/Logger';

const TAG = '[IndexPage]';

class routerParams {
  src: string

  constructor(str: string) {
    this.src = str
  }
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          // 处理点击事件
          hilog.info(0x0000, 'testTag', '处理点击事件');

          router.pushUrl({
            url: RouterPath.ToDoListPage,
            params: new routerParams(this.message)
          }).catch((error: Error) => {
            Logger.info(TAG, 'IndexPage push error' + JSON.stringify(error));
          });
        })
    }
    .height('100%')
    .width('100%')

  }
}