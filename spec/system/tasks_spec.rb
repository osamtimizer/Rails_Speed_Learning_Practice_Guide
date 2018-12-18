require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザA', email: 'a@example.com' )
      user_b = FactoryBot.create(:user, name: 'ユーザB', email: 'b@example.com' )
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
    end

    context 'ユーザAでログインしている時' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザAが作成したタスクが表示される' do
        expect(page).to have_content '最初のタスク'
      end
    end

    context 'ユーザBでログインしている時' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: 'b@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザAが作成したタスクが表示されない' do
        expect(page).to have_no_content '最初のタスク'
      end
    end
  end
end