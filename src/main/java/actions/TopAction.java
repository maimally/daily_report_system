package actions;

import java.io.IOException;

import javax.servlet.ServletException;

import constants.AttributeConst;
import constants.ForwardConst;

/**
 * トップページに関する処理を行うActionクラス
 *
 */
public class TopAction extends ActionBase {

    /**
     * indexメソッドを実行する
     */
    public TopAction() {
        // TODO 自動生成されたコンストラクター・スタブ
    }

    @Override
    public void process() throws ServletException, IOException {
        // TODO 自動生成されたメソッド・スタブ

        invoke();

    }

    /**
     * 一覧画面を表示する
     */
    public void index() throws ServletException, IOException {
      //セッションにフラッシュメッセージが設定されている場合はリクエストスコープに移し替え、セッションからは削除する
        String flush = getSessionScope(AttributeConst.FLUSH);
        if (flush != null) {
            putRequestScope(AttributeConst.FLUSH, flush);
            removeSessionScope(AttributeConst.FLUSH);

        }

        //一覧画面を表示
        forward(ForwardConst.FW_TOP_INDEX);
    }
}