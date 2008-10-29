require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:candidates)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_candidate
    assert_difference('Candidate.count') do
      post :create, :candidate => { }
    end

    assert_redirected_to candidate_path(assigns(:candidate))
  end

  def test_should_show_candidate
    get :show, :id => candidates(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => candidates(:one).id
    assert_response :success
  end

  def test_should_update_candidate
    put :update, :id => candidates(:one).id, :candidate => { }
    assert_redirected_to candidate_path(assigns(:candidate))
  end

  def test_should_destroy_candidate
    assert_difference('Candidate.count', -1) do
      delete :destroy, :id => candidates(:one).id
    end

    assert_redirected_to candidates_path
  end
end
