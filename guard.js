import React from 'react'
import { act } from 'react-dom/test-utils'
import { mount, configure } from 'enzyme'
import { Provider } from 'mobx-react'
import createAppStore from 'pharma/js/stores/createAppStore'
import stubSession from 'common/js/test/stubSession'
import Adapter from 'enzyme-adapter-react-16'
import * as PharmaReportSource from 'pharma/js/sources/PharmaReportSource'
import InProgressDetail from './InProgressDetail'

configure({ adapter: new Adapter() })

jest.mock('pharma/js/sources/PharmaReportSource', () => ({
  fetchPharmaReportsInProgress: jest.fn()
}))

describe('InProgressDetail view', () => {
  let store
  let routingStore
  let pharmaInProgressReportStore
  let mockReport

  beforeAll(() => {
    const mockSession = {
      physicianId: '1',
      email: 'ptummon@foundationmedicine.com',
      roles: ['partner-portal']
    }

    mockReport = {
      analysisStartedDate: '2021-03-31T00:00:00',
      compBioCompletedDate: '2021-06-09T00:00:00',
      fileName: undefined,
      isNew: undefined,
      isRead: false,
      orderCreatedDate: '2021-02-23T00:00:00',
      orderStatus: 'Reported',
      partnerName: 'Merck',
      qc: 'Reported',
      reportAvailable: '-- --',
      reportAvailableValue: null,
      reportedDate: '2021-06-12T00:00:00',
      site: undefined,
      specimenReceivedDate: '2021-02-12T00:00:00',
      status: 'New',
      subject: undefined,
      subjectId: '234567',
      trf: 'ORD-123343231-01',
      type: undefined,
      updated: false
    }

    store = createAppStore()
    pharmaInProgressReportStore = store.pharmaInProgressReportStore
    routingStore = store.routingStore

    const fakeSession = stubSession()
    return fakeSession
      .willLoginUser(mockSession)
      .login()
  })

  it('should render correctly', async () => {
    PharmaReportSource.fetchPharmaReportsInProgress.mockImplementation(() => new Promise((resolve) => {
      resolve([mockReport])
    }))

    let wrapper

    await act(async () => {
      wrapper = mount(
        <Provider
          pharmaInProgressReportStore={pharmaInProgressReportStore}
          routingStore={routingStore}
          sessionStore={store.sessionStore}
        >
          <InProgressDetail
            location={{
              search: '?partnerId=dummyvalue&trialId=dummyvalue'
            }}
            match={{
              params: {
                trf: 'ORD-123343231-01'
              }
            }}
          />
        </Provider>
      )
    })

    wrapper.update()

    expect(wrapper.isEmptyRender()).toBe(false)
    expect(wrapper.find('InProgressDetail').exists()).toBe(true)
    expect(wrapper.find('TimelineSection').exists()).toBe(true)
  })

  it('banner should show when the button is clicked', () => {
    const mockPharmaInProgressReportStore = {
      uiStore: {
        resolveStatusBanner: false, // Observable set to true
        setShowBannerResolve: jest.fn(),
        showBannerResolve: false,
        setResolveStatusBanner: jest.fn()
      },
      baseStore: {
        fetcherStore: {
          loaded: true
        },
        reportsStore: {
          reports: [{
            trf: 'report1',
            subjectId: 'patient1',
            orderStatus: 'onHold'
          }]
        },
        fetchReports: jest.fn()
      }

    }
    const mockRoutingStore = {
      push: jest.fn()
    }
    const wrapper = mount(
      <Provider
        pharmaInProgressReportStore={mockPharmaInProgressReportStore}
        routingStore={mockRoutingStore}
      >
        <InProgressDetail
          location={{
            search: '?partnerId=dummyvalue&trialId=dummyvalue'
          }}
          match={{
            params: {
              trf: 'ORD-123343231-01'
            }
          }}
        />
      </Provider>
    )

    wrapper.find('Button[text="RESOLVE"]').simulate('click')
    expect(mockPharmaInProgressReportStore.uiStore.setShowBannerResolve).toHaveBeenCalledWith(true)
    expect(mockPharmaInProgressReportStore.uiStore.setResolveStatusBanner).toHaveBeenCalledWith(true)
  })

  it('should show banner when observable showBannerResolve is true', async () => {
    let wrapper

    const mockPharmaInProgressReportStore = {
      uiStore: {
        resolveStatusBanner: true,
        setShowBannerResolve: jest.fn(),
        showBannerResolve: true,
        setResolveStatusBanner: jest.fn()
      },
      baseStore: {
        fetcherStore: {
          loaded: true
        },
        reportsStore: {
          reports: [{
            trf: 'report1',
            subjectId: 'patient1',
            orderStatus: 'onHold'
          }]
        },
        fetchReports: jest.fn()
      }
    }
    const mockRoutingStore = {
      push: jest.fn()
    }
    await act(async () => {
      wrapper = mount(
        <Provider
          pharmaInProgressReportStore={mockPharmaInProgressReportStore}
          routingStore={mockRoutingStore}
        >
          <InProgressDetail
            location={{
              search: '?partnerId=dummyvalue&trialId=dummyvalue'
            }}
            match={{
              params: {
                trf: 'ORD-123343231-01'
              }
            }}
          />
        </Provider>
      )
    })

    wrapper.update()
    expect(mockPharmaInProgressReportStore.uiStore.showBannerResolve).toBe(true)
    expect(wrapper.find('Banner').exists()).toBe(true)
  })

  it('banner should disappear when showBannerResolve is false', async () => {
    let wrapper

    const mockRoutingStore = {
      push: jest.fn()
    }

    const mockPharmaInProgressReportStore = {
      uiStore: {
        resolveStatusBanner: true,
        setShowBannerResolve: jest.fn(),
        showBannerResolve: false,
        setResolveStatusBanner: jest.fn()
      },
      baseStore: {
        fetcherStore: {
          loaded: true
        },
        reportsStore: {
          reports: [{
            trf: 'report1',
            subjectId: 'patient1',
            orderStatus: 'onHold'
          }]
        },
        fetchReports: jest.fn()
      }
    }

    await act(async () => {
      wrapper = mount(
        <Provider
          pharmaInProgressReportStore={mockPharmaInProgressReportStore}
          routingStore={mockRoutingStore}
        >
          <InProgressDetail
            location={{
              search: '?partnerId=dummyvalue&trialId=dummyvalue'
            }}
            match={{
              params: {
                trf: 'ORD-123343231-01'
              }
            }}
          />
        </Provider>
      )
    })
    expect(mockPharmaInProgressReportStore.uiStore.showBannerResolve).toBe(false)
    expect(wrapper.find('Banner').exists()).toBe(false)
  })

  it('should not call setShowBannerResolve when resolveStatusBanner is false', async () => {
    let wrapper

    const mockPharmaInProgressReportStore = {
      uiStore: {
        resolveStatusBanner: false,
        setShowBannerResolve: jest.fn(),
        showBannerResolve: false,
        setResolveStatusBanner: jest.fn()
      },
      baseStore: {
        fetcherStore: {
          loaded: true
        },
        reportsStore: {
          reports: [{
            trf: 'report1',
            subjectId: 'patient1',
            orderStatus: 'onHold'
          }]
        },
        fetchReports: jest.fn()
      }
    }

    const mockRoutingStore = {
      push: jest.fn()
    }

    await act(async () => {
      wrapper = mount(
        <Provider
          pharmaInProgressReportStore={mockPharmaInProgressReportStore}
          routingStore={mockRoutingStore}
        >
          <InProgressDetail
            location={{
              search: '?partnerId=dummyvalue&trialId=dummyvalue'
            }}
            match={{
              params: {
                trf: 'ORD-123343231-01'
              }
            }}
          />
        </Provider>
      )
    })

    expect(wrapper.exists()).toBe(true)
    expect(mockPharmaInProgressReportStore.uiStore.setShowBannerResolve).not.toHaveBeenCalled()
  })
})
