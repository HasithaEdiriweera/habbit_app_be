require 'test_helper'

class Api::V1::HabbitsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @token = ENV['AUTHENTICATION_TOKEN']
    @habbit = Habbit.create(name: 'Test Habbit', is_completed: false)
  end

  test 'should get index' do
    get api_v1_habbits_url, headers: { 'Authorization': "Bearer #{@token}" }
    assert_response :success

    response_json = JSON.parse(response.body)
    assert_equal Habbit.count, response_json.size
  end

  test 'should create habbit' do
    assert_difference('Habbit.count') do
      post api_v1_habbits_url,
           params: { habbit: { name: 'New Habbit', is_completed: false } },
           headers: { 'Authorization': "Bearer #{@token}" }
    end
  end

  test 'should not create habbit with invalid token' do
    assert_no_difference('Habbit.count') do
      post api_v1_habbits_url,
           params: { habbit: { name: 'New Habbit', is_completed: false } },
           headers: { 'Authorization': 'Token invalid' }
    end

    assert_response :unauthorized
  end

  test 'should update habbit' do
    patch api_v1_habbit_url(@habbit),
          params: { habbit: { name: 'Updated Habbit' } },
          headers: { 'Authorization': "Bearer #{@token}" }

    assert_response :success

    @habbit.reload
    assert_equal 'Updated Habbit', @habbit.name
  end


  test 'should destroy habbit' do
    assert_difference('Habbit.count', -1) do
      delete api_v1_habbit_url(@habbit), headers: { 'Authorization': "Bearer #{@token}" }
    end

    assert_response :no_content
  end

end
